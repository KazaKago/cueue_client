import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/model/auth/apple_auth_info.dart';
import 'package:cueue/model/exception/autorization_cancel_exception.dart';
import 'package:cueue/model/exception/autorization_failed_exception.dart';
import 'package:flutter/foundation.dart';
import 'package:nonce/nonce.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:universal_html/html.dart';

SWRTriggerState<void, AppleAuthInfo> useAuthorizeWithApple() {
  const appleClientId = String.fromEnvironment('appleClientId');
  const appleRedirectUri = String.fromEnvironment('appleRedirectUri');
  return useSWRTrigger<void, AppleAuthInfo>((_) async {
    try {
      final rawNonce = Nonce.generate();
      final state = Nonce.generate();
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: appleClientId,
          redirectUri: Uri.parse(kIsWeb ? 'https://${window.location.host}' : appleRedirectUri),
        ),
        nonce: sha256.convert(utf8.encode(rawNonce)).toString(),
        state: state,
      );
      if (state != credential.state) {
        throw const AuthorizationFailedException();
      }
      return AppleAuthInfo(idToken: credential.identityToken, accessToken: credential.authorizationCode, rawNonce: rawNonce);
    } on SignInWithAppleAuthorizationException catch (exception) {
      switch (exception.code) {
        case AuthorizationErrorCode.canceled:
          throw const AuthorizationCanceledException();
        case AuthorizationErrorCode.failed:
          throw const AuthorizationFailedException();
        case AuthorizationErrorCode.invalidResponse:
          throw const AuthorizationFailedException();
        case AuthorizationErrorCode.notHandled:
          throw const AuthorizationFailedException();
        case AuthorizationErrorCode.unknown:
          throw const AuthorizationFailedException();
        case AuthorizationErrorCode.notInteractive:
          throw const AuthorizationFailedException();
      }
    }
  });
}
