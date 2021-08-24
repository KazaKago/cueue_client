import 'package:cueue/presentation/view/global/modal/text_field_dialog_event.dart';
import 'package:flutter/material.dart';

class TextFieldDialog {
  TextFieldDialog(this._context, {this.title, this.message, this.labelText, this.hintText, this.defaultText, this.keyboardType = TextInputType.text, this.positiveButton, this.neutralButton, this.negativeButton}) : _textEditingController = TextEditingController(text: defaultText) {
    if (keyboardType == TextInputType.visiblePassword) _isObscureText = true;
  }

  final BuildContext _context;
  final String? title;
  final String? message;
  final String? labelText;
  final String? hintText;
  final String? defaultText;
  final TextInputType keyboardType;
  final String? positiveButton;
  final String? neutralButton;
  final String? negativeButton;
  final TextEditingController _textEditingController;
  bool _isObscureText = false;

  Future<TextFieldDialogEvent?> show() {
    final buttons = <Widget>[];
    if (negativeButton != null) {
      buttons.add(TextButton(
        onPressed: () => Navigator.of(_context).pop(TextFieldDialogEvent.negative(_textEditingController.text, originalText: defaultText)),
        child: Text(negativeButton!),
      ));
    }
    if (neutralButton != null) {
      buttons.add(TextButton(
        onPressed: () => Navigator.of(_context).pop(TextFieldDialogEvent.neutral(_textEditingController.text, originalText: defaultText)),
        child: Text(neutralButton!),
      ));
    }
    if (positiveButton != null) {
      buttons.add(TextButton(
        onPressed: () => Navigator.of(_context).pop(TextFieldDialogEvent.positive(_textEditingController.text, originalText: defaultText)),
        child: Text(positiveButton!),
      ));
    }
    return showDialog(
        context: _context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: (title != null) ? Text(title!) : null,
            content: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
              return TextField(
                controller: _textEditingController,
                autofocus: true,
                keyboardType: keyboardType,
                obscureText: _isObscureText,
                decoration: InputDecoration(
                    labelText: labelText,
                    hintText: hintText,
                    suffixIcon: (keyboardType == TextInputType.visiblePassword)
                        ? IconButton(
                            icon: Icon(_isObscureText ? Icons.visibility_off : Icons.visibility),
                            onPressed: () => setState(() => _isObscureText = !_isObscureText),
                          )
                        : null),
              );
            }),
            actions: buttons,
          );
        });
  }
}
