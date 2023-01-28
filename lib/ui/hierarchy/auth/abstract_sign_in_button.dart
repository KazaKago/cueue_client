import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

abstract class AbstractSignInButton extends HookWidget {
  const AbstractSignInButton({
    super.key,
    required this.enabled,
    required this.onAuth,
  });

  final bool enabled;
  final void Function() onAuth;

  Widget buildButton(BuildContext context, {required IconData iconData, required Color color, required String authText}) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      icon: Icon(iconData),
      label: Text(authText),
      onPressed: enabled ? onAuth : null,
    );
  }
}
