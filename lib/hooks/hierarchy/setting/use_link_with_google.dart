import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/global/utils/use_overlay_loading.dart';
import 'package:cueue/hooks/global/utils/use_overlay_toast.dart';
import 'package:cueue/hooks/hierarchy/auth/use_authorize_with_google.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_firebase_user.dart';
import 'package:cueue/model/auth/firebase_auth_extension.dart';
import 'package:cueue/model/auth/google_auth_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<void, GoogleAuthInfo> useLinkWithGoogle(WidgetRef ref) {
  final overlayLoading = useOverlayLoading();
  final overlayToast = useOverlayToast();
  final showErrorDialog = useShowErrorDialog(ref);
  final intl = useIntl();
  final firebaseUserState = useFirebaseUser(ref);
  final authorizeWithGoogle = useAuthorizeWithGoogle();
  final linkWithGoogle = useSWRTrigger<GoogleAuthInfo, bool>((authInfo) async {
    try {
      final credential = GoogleAuthProvider.credential(accessToken: authInfo.accessToken, idToken: authInfo.idToken);
      await firebaseUserState.data?.linkWithCredential(credential);
      return true;
    } on FirebaseAuthException catch (exception) {
      throw await exception.parse();
    }
  });
  useEffectSWRData<GoogleAuthInfo>(authorizeWithGoogle, (authInfo) {
    linkWithGoogle.trigger(authInfo);
  });
  useEffectSWRData(linkWithGoogle, (_) {
    overlayToast(intl.linkedWithGoogle);
  });
  useEffectSWRIsMutating(linkWithGoogle, ({required isMutating}) {
    overlayLoading.trigger(isMutating);
  });
  useEffectSWRError(linkWithGoogle, (error) {
    showErrorDialog.trigger(error);
  });
  return authorizeWithGoogle;
}
