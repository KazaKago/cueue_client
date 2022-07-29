import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/hierarchy/auth/abstract_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInWithAppleButton extends AbstractSignInButton {
  const SignInWithAppleButton({
    super.key,
    required super.authenticationType,
    required super.enabled,
    required super.onAuth,
    required super.onReauth,
  });

  @override
  Widget build(BuildContext context) {
    return buildButton(
      context,
      iconData: FontAwesomeIcons.apple,
      color: Colors.black,
      authText: intl(context).withAppleAccount(intl(context).auth),
      reauthText: intl(context).withAppleAccount(intl(context).reAuth),
    );
  }
}
