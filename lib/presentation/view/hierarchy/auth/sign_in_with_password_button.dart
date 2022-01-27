import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/hierarchy/auth/abstract_sign_in_button.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authentication_type.dart';
import 'package:flutter/material.dart';

class SignInWithPasswordButton extends AbstractSignInButton {
  const SignInWithPasswordButton({
    final Key? key,
    required final AuthenticationType authenticationType,
    required final bool enabled,
    required final void Function() onSignUp,
    required final void Function() onSignIn,
    required final void Function() onReauth,
  }) : super(
          key: key,
          authenticationType: authenticationType,
          enabled: enabled,
          onSignUp: onSignUp,
          onSignIn: onSignIn,
          onReauth: onReauth,
        );

  @override
  Widget build(final BuildContext context) {
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
