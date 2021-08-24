import 'package:cueue/presentation/view/global/modal/simple_message_dialog_event.dart';
import 'package:flutter/material.dart';

class SimpleMessageDialog {
  const SimpleMessageDialog(this._context, {this.title, this.message, this.positiveButton, this.neutralButton, this.negativeButton});

  final BuildContext _context;
  final String? title;
  final String? message;
  final String? positiveButton;
  final String? neutralButton;
  final String? negativeButton;

  Future<SimpleMessageDialogEvent?> show() {
    final buttons = <Widget>[];
    if (negativeButton != null) {
      buttons.add(TextButton(
        onPressed: () => Navigator.of(_context).pop(const SimpleMessageDialogEvent.negative()),
        child: Text(negativeButton!),
      ));
    }
    if (neutralButton != null) {
      buttons.add(TextButton(
        onPressed: () => Navigator.of(_context).pop(const SimpleMessageDialogEvent.neutral()),
        child: Text(neutralButton!),
      ));
    }
    if (positiveButton != null) {
      buttons.add(TextButton(
        onPressed: () => Navigator.of(_context).pop(const SimpleMessageDialogEvent.positive()),
        child: Text(positiveButton!),
      ));
    }
    return showDialog(
      context: _context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: (title != null) ? Text(title!) : null,
          content: (message != null) ? Text(message!) : null,
          actions: buttons,
        );
      },
    );
  }
}
