import 'package:flutter/material.dart';

abstract class AbstractSignInButton extends StatelessWidget {
  const AbstractSignInButton({
    super.key,
    required this.enabled,
    required this.onAuth,
  });

  final bool enabled;
  final void Function() onAuth;

  Widget buildButton(BuildContext context, {required IconData iconData, required Color color, required String authText}) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(primary: color),
      icon: Icon(iconData),
      label: Text(authText),
      onPressed: enabled ? onAuth : null,
    );
  }
}
