import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:cueue/domain/model/global/exception/autorization_cancel_exception.dart';
import 'package:cueue/domain/model/global/exception/autorization_failed_exception.dart';
import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authorizer/apple_callback_url.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authorizer/apple_client_id.dart';
import 'package:flutter/material.dart';
import 'package:nonce/nonce.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleAuthorizer {
  const AppleAuthorizer();

  Future<AppleAuthInfo> authorize(final BuildContext context) async {
    try {
      final rawNonce = Nonce.generate();
      final state = Nonce.generate();
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: const AppleClientId().value,
          redirectUri: const AppleCallbackUrl().value,
        ),
        nonce: sha256.convert(utf8.encode(rawNonce)).toString(),
        state: state,
      );
      if (state != credential.state) {
        throw const AuthorizationFailedException();
      }
      return AppleAuthInfo(idToken: credential.identityToken!, accessToken: credential.authorizationCode, rawNonce: rawNonce);
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
  }
}
