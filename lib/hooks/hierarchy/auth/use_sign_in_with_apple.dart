import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_overlay_loading.dart';
import 'package:cueue/hooks/hierarchy/auth/use_authorize_with_apple.dart';
import 'package:cueue/hooks/hierarchy/auth/use_replace_signed_in_page.dart';
import 'package:cueue/model/auth/apple_auth_info.dart';
import 'package:cueue/model/auth/apple_provider_id.dart';
import 'package:cueue/model/auth/firebase_auth_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<void, AppleAuthInfo> useSignInWithApple(WidgetRef ref) {
  final overlayLoading = useOverlayLoading();
  final showErrorDialog = useShowErrorDialog(ref);
  final authorizeWithApple = useAuthorizeWithApple();
  final replaceSignedInPage = useReplaceSignedInPage(ref);
  final signInWithApple = useSWRTrigger<AppleAuthInfo, bool>((authInfo) async {
    try {
      final credential = OAuthProvider(const AppleProviderId().value).credential(idToken: authInfo.idToken, accessToken: authInfo.accessToken, rawNonce: authInfo.rawNonce);
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } on FirebaseAuthException catch (exception) {
      throw await exception.parse();
    }
  });
  useEffectSWRData<AppleAuthInfo>(authorizeWithApple, (authInfo) {
    signInWithApple.trigger(authInfo);
  });
  useEffectSWRData(signInWithApple, (_) {
    replaceSignedInPage.trigger(null);
  });
  useEffectSWRIsMutating(signInWithApple, ({required isMutating}) {
    overlayLoading.trigger(isMutating);
  });
  useEffectSWRError(signInWithApple, (error) {
    showErrorDialog.trigger(error);
  });
  return authorizeWithApple;
}
