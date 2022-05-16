import 'package:cueue/presentation/view/hierarchy/auth/authentication_type.dart';
import 'package:flutter/material.dart';

abstract class AbstractSignInButton extends StatelessWidget {
  const AbstractSignInButton({
    super.key,
    required this.authenticationType,
    required this.enabled,
    required this.onSignUp,
    required this.onSignIn,
    required this.onReauth,
  });

  final AuthenticationType authenticationType;
  final bool enabled;
  final void Function() onSignUp;
  final void Function() onSignIn;
  final void Function() onReauth;

  Widget buildButton(BuildContext context, {required IconData iconData, required Color color, required String signUpText, required String signInText, required String reauthText}) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(primary: color),
      icon: Icon(iconData),
      label: Text(
        _whenType(
          signUp: () => signUpText,
          signIn: () => signInText,
          reauth: () => reauthText,
        ),
      ),
      onPressed: enabled ? () => _whenType(signUp: onSignUp, signIn: onSignIn, reauth: onReauth) : null,
    );
  }

  R _whenType<R>({required R Function() signUp, required R Function() signIn, required R Function() reauth}) {
    switch (authenticationType) {
      case AuthenticationType.signUp:
        return signUp();
      case AuthenticationType.signIn:
        return signIn();
      case AuthenticationType.reauth:
        return reauth();
    }
  }
}
