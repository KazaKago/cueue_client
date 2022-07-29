import 'package:cueue/presentation/view/hierarchy/auth/authentication_type.dart';
import 'package:flutter/material.dart';

abstract class AbstractSignInButton extends StatelessWidget {
  const AbstractSignInButton({
    super.key,
    required this.authenticationType,
    required this.enabled,
    required this.onAuth,
    required this.onReauth,
  });

  final AuthenticationType authenticationType;
  final bool enabled;
  final void Function() onAuth;
  final void Function() onReauth;

  Widget buildButton(BuildContext context, {required IconData iconData, required Color color, required String authText, required String reauthText}) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(primary: color),
      icon: Icon(iconData),
      label: Text(
        _whenType(
          onAuth: () => authText,
          onReauth: () => reauthText,
        ),
      ),
      onPressed: enabled ? () => _whenType(onAuth: onAuth, onReauth: onReauth) : null,
    );
  }

  R _whenType<R>({required R Function() onAuth, required R Function() onReauth}) {
    switch (authenticationType) {
      case AuthenticationType.auth:
        return onAuth();
      case AuthenticationType.reauth:
        return onReauth();
    }
  }
}
