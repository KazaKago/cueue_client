import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/hierarchy/auth/abstract_sign_in_button.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authentication_type.dart';
import 'package:flutter/material.dart';

class SignInWithPasswordButton extends AbstractSignInButton {
  const SignInWithPasswordButton({
    Key? key,
    required AuthenticationType authenticationType,
    required bool enabled,
    required void Function() onSignUp,
    required void Function() onSignIn,
    required void Function() onReauth,
  }) : super(
          key: key,
          authenticationType: authenticationType,
          enabled: enabled,
          onSignUp: onSignUp,
          onSignIn: onSignIn,
          onReauth: onReauth,
        );

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
