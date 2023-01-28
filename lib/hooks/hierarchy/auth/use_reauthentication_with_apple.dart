import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_easy_loading.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/hierarchy/auth/use_authorize_with_apple.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_firebase_user.dart';
import 'package:cueue/hooks/hierarchy/setting/use_delete_account.dart';
import 'package:cueue/model/auth/apple_auth_info.dart';
import 'package:cueue/model/auth/apple_provider_id.dart';
import 'package:cueue/model/auth/firebase_auth_extension.dart';
import 'package:cueue/model/exception/require_reautentication_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<void, AppleAuthInfo> useReauthenticationWithApple(WidgetRef ref, RequireReauthenticationException error) {
  final easyLoading = useEasyLoading();
  final showErrorDialog = useShowErrorDialog(ref);
  final authorizeWithApple = useAuthorizeWithApple();
  final deleteAccount = useDeleteAccount(ref);
  final firebaseUserState = useFirebaseUser(ref);
  final reauthenticationWithApple = useSWRTrigger<AppleAuthInfo, bool>((authInfo) async {
    try {
      final credential = OAuthProvider(const AppleProviderId().value).credential(idToken: authInfo.idToken, accessToken: authInfo.accessToken, rawNonce: authInfo.rawNonce);
      await firebaseUserState.data?.reauthenticateWithCredential(credential);
      return true;
    } on FirebaseAuthException catch (exception) {
      throw await exception.parse();
    }
  });
  useEffectSWRData<void, AppleAuthInfo>(authorizeWithApple, (authInfo) {
    reauthenticationWithApple.trigger(authInfo);
  });
  useEffectSWRData(reauthenticationWithApple, (_) {
    error.type.when(
      deleteAccount: () => deleteAccount.trigger(null),
    );
  });
  useEffectSWRIsMutating(reauthenticationWithApple, (isMutating) {
    easyLoading.trigger(isMutating);
  });
  useEffectSWRError(reauthenticationWithApple, (error) {
    showErrorDialog.trigger(error);
  });
  return authorizeWithApple;
}
