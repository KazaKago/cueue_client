import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_easy_loading.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/hierarchy/auth/use_authorize_with_apple.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_firebase_user.dart';
import 'package:cueue/model/auth/apple_auth_info.dart';
import 'package:cueue/model/auth/apple_provider_id.dart';
import 'package:cueue/model/auth/firebase_auth_extension.dart';
import 'package:cueue/ui/global/modal/fried_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<void, AppleAuthInfo> useLinkWithApple(WidgetRef ref) {
  final easyLoading = useEasyLoading();
  final showFriedToast = useShowFriedToast();
  final showErrorDialog = useShowErrorDialog(ref);
  final intl = useIntl();
  final firebaseUserState = useFirebaseUser(ref);
  final authorizeWithApple = useAuthorizeWithApple();
  final linkWithApple = useSWRTrigger<AppleAuthInfo, bool>((authInfo) async {
    try {
      final credential = OAuthProvider(const AppleProviderId().value).credential(idToken: authInfo.idToken, accessToken: authInfo.accessToken, rawNonce: authInfo.rawNonce);
      await firebaseUserState.data?.linkWithCredential(credential);
      return true;
    } on FirebaseAuthException catch (exception) {
      throw await exception.parse();
    }
  });
  useEffectSWRData<AppleAuthInfo>(authorizeWithApple, (authInfo) {
    linkWithApple.trigger(authInfo);
  });
  useEffectSWRData(linkWithApple, (_) {
    showFriedToast(intl.linkedWithApple);
  });
  useEffectSWRIsMutating(linkWithApple, ({required isMutating}) {
    easyLoading.trigger(isMutating);
  });
  useEffectSWRError(linkWithApple, (error) {
    showErrorDialog.trigger(error);
  });
  return authorizeWithApple;
}
