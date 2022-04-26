import 'package:cueue/domain/model/global/exception/autorization_cancel_exception.dart';
import 'package:cueue/domain/model/hierarchy/auth/google_auth_info.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthorizer {
  const GoogleAuthorizer();

  Future<GoogleAuthInfo> authorize(BuildContext context) async {
    final googleSignInAccount = await GoogleSignIn().signIn();
    if (googleSignInAccount != null) {
      final authResult = await googleSignInAccount.authentication;
      return GoogleAuthInfo(accessToken: authResult.accessToken!, idToken: authResult.idToken!);
    } else {
      throw const AuthorizationCanceledException();
    }
  }
}
