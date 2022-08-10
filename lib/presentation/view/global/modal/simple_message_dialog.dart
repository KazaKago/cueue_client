import 'package:cueue/presentation/view/global/modal/simple_message_dialog_event.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SimpleMessageDialog extends HookConsumerWidget {
  const SimpleMessageDialog({super.key, this.title, this.message, this.positiveButton, this.neutralButton, this.negativeButton});

  final String? title;
  final String? message;
  final String? positiveButton;
  final String? neutralButton;
  final String? negativeButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttons = <Widget>[];
    if (negativeButton != null) {
      buttons.add(
        TextButton(
          onPressed: () => Navigator.of(context).pop(const SimpleMessageDialogEvent.negative()),
          child: Text(negativeButton!),
        ),
      );
    }
    if (neutralButton != null) {
      buttons.add(
        TextButton(
          onPressed: () => Navigator.of(context).pop(const SimpleMessageDialogEvent.neutral()),
          child: Text(neutralButton!),
        ),
      );
    }
    if (positiveButton != null) {
      buttons.add(
        TextButton(
          onPressed: () => Navigator.of(context).pop(const SimpleMessageDialogEvent.positive()),
          child: Text(positiveButton!),
        ),
      );
    }
    return AlertDialog(
      title: (title != null) ? Text(title!) : null,
      content: (message != null) ? Text(message!) : null,
      actions: buttons,
    );
  }
}
