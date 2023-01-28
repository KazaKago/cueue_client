import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/model/auth/google_auth_info.dart';
import 'package:cueue/model/exception/autorization_cancel_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

SWRTriggerState<void, GoogleAuthInfo> useAuthorizeWithGoogle() {
  return useSWRTrigger<void, GoogleAuthInfo>((_) async {
    final googleSignInAccount = await GoogleSignIn().signIn();
    if (googleSignInAccount != null) {
      final authResult = await googleSignInAccount.authentication;
      return GoogleAuthInfo(accessToken: authResult.accessToken, idToken: authResult.idToken);
    } else {
      throw const AuthorizationCanceledException();
    }
  });
}
