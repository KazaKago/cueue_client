import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_easy_loading.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/hierarchy/auth/use_authorize_with_google.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_firebase_user.dart';
import 'package:cueue/hooks/hierarchy/setting/use_delete_account.dart';
import 'package:cueue/model/auth/firebase_auth_extension.dart';
import 'package:cueue/model/auth/google_auth_info.dart';
import 'package:cueue/model/exception/require_reautentication_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<void, GoogleAuthInfo> useReauthenticationWithGoogle(WidgetRef ref, RequireReauthenticationException error) {
  final easyLoading = useEasyLoading();
  final showErrorDialog = useShowErrorDialog(ref);
  final authorizeWithGoogle = useAuthorizeWithGoogle();
  final firebaseUserState = useFirebaseUser(ref);
  final deleteAccount = useDeleteAccount(ref);
  final reauthenticationWithGoogle = useSWRTrigger<GoogleAuthInfo, bool>((authInfo) async {
    try {
      final credential = GoogleAuthProvider.credential(accessToken: authInfo.accessToken, idToken: authInfo.idToken);
      await firebaseUserState.data?.reauthenticateWithCredential(credential);
      return true;
    } on FirebaseAuthException catch (exception) {
      throw await exception.parse();
    }
  });
  useEffectSWRData<GoogleAuthInfo>(authorizeWithGoogle, (authInfo) {
    reauthenticationWithGoogle.trigger(authInfo);
  });
  useEffectSWRData(reauthenticationWithGoogle, (_) {
    error.type.when(
      deleteAccount: () => deleteAccount.trigger(null),
    );
  });
  useEffectSWRIsMutating(reauthenticationWithGoogle, ({required isMutating}) {
    easyLoading.trigger(isMutating);
  });
  useEffectSWRError(reauthenticationWithGoogle, (error) {
    showErrorDialog.trigger(error);
  });
  return authorizeWithGoogle;
}
