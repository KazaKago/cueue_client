import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_easy_loading.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/hierarchy/auth/use_authorize_with_google.dart';
import 'package:cueue/hooks/hierarchy/auth/use_replace_signed_in_page.dart';
import 'package:cueue/model/auth/firebase_auth_extension.dart';
import 'package:cueue/model/auth/google_auth_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<void, GoogleAuthInfo> useSignInWithGoogle(WidgetRef ref) {
  final easyLoading = useEasyLoading();
  final showErrorDialog = useShowErrorDialog(ref);
  final authorizeWithGoogle = useAuthorizeWithGoogle();
  final replaceSignedInPage = useReplaceSignedInPage(ref);
  final signInWithGoogle = useSWRTrigger<GoogleAuthInfo, bool>((authInfo) async {
    try {
      final credential = GoogleAuthProvider.credential(accessToken: authInfo.accessToken, idToken: authInfo.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } on FirebaseAuthException catch (exception) {
      throw await exception.parse();
    }
  });
  useEffectSWRData<GoogleAuthInfo>(authorizeWithGoogle, (authInfo) {
    signInWithGoogle.trigger(authInfo);
  });
  useEffectSWRData(signInWithGoogle, (_) {
    replaceSignedInPage.trigger(null);
  });
  useEffectSWRIsMutating(signInWithGoogle, (isMutating) {
    easyLoading.trigger(isMutating);
  });
  useEffectSWRError(signInWithGoogle, (error) {
    showErrorDialog.trigger(error);
  });
  return authorizeWithGoogle;
}
