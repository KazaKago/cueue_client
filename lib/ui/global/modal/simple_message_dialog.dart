import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SimpleMessageDialogData {
  SimpleMessageDialogData({this.title, this.message, this.positiveButton, this.neutralButton, this.negativeButton});

  final String? title;
  final String? message;
  final String? positiveButton;
  final String? neutralButton;
  final String? negativeButton;
}

SWRTriggerState<SimpleMessageDialogData, SimpleMessageDialogEvent?> useShowSimpleMessageDialog() {
  final context = useContext();
  return useSWRTrigger((data) {
    return showDialog(
      context: context,
      builder: (context) => SimpleMessageDialog(
        title: data.title,
        message: data.message,
        positiveButton: data.positiveButton,
        neutralButton: data.neutralButton,
        negativeButton: data.negativeButton,
      ),
    );
  });
}

class SimpleMessageDialog extends StatelessWidget {
  const SimpleMessageDialog({super.key, this.title, this.message, this.positiveButton, this.neutralButton, this.negativeButton});

  final String? title;
  final String? message;
  final String? positiveButton;
  final String? neutralButton;
  final String? negativeButton;

  @override
  Widget build(BuildContext context) {
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
