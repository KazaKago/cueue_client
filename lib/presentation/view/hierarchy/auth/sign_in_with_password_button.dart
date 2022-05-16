import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/hierarchy/auth/abstract_sign_in_button.dart';
import 'package:flutter/material.dart';

class SignInWithPasswordButton extends AbstractSignInButton {
  const SignInWithPasswordButton({
    super.key,
    required super.authenticationType,
    required super.enabled,
    required super.onSignUp,
    required super.onSignIn,
    required super.onReauth,
  });

  @override
  Widget build(BuildContext context) {
    return buildButton(
      context,
      iconData: Icons.mail_outline,
      color: Theme.of(context).colorScheme.primary,
      signUpText: intl(context).signUpWithPassword,
      signInText: intl(context).signInWithPassword,
      reauthText: intl(context).reAuthWithPassword,
    );
  }
}
