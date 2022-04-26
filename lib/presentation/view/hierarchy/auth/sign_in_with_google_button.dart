import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/hierarchy/auth/abstract_sign_in_button.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authentication_type.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInWithGoogleButton extends AbstractSignInButton {
  const SignInWithGoogleButton({
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
      iconData: FontAwesomeIcons.google,
      color: Colors.blueAccent,
      signUpText: intl(context).withGoogleAccount(intl(context).auth),
      signInText: intl(context).withGoogleAccount(intl(context).auth),
      reauthText: intl(context).withGoogleAccount(intl(context).reAuth),
    );
  }
}
