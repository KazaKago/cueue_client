import 'package:cueue/presentation/view/global/modal/multi_text_field_dialog_event.dart';
import 'package:flutter/material.dart';

class MultiTextFieldDialog extends StatelessWidget {
  const MultiTextFieldDialog(this._textFieldContents, {super.key, this.title, this.positiveButton, this.neutralButton, this.negativeButton});

  final List<TextFieldContent> _textFieldContents;
  final String? title;
  final String? positiveButton;
  final String? neutralButton;
  final String? negativeButton;

  @override
  Widget build(BuildContext context) {
    final buttons = <Widget>[];
    if (negativeButton != null) {
      buttons.add(
        TextButton(
          onPressed: () => Navigator.of(context).pop(
            MultiTextFieldDialogEvent.negative(
              _textFieldContents.map((textFieldContent) => MultiTextFieldDialogResult(textFieldContent.textEditingController.text, textFieldContent.defaultText)).toList(),
            ),
          ),
          child: Text(negativeButton!),
        ),
      );
    }
    if (neutralButton != null) {
      buttons.add(
        TextButton(
          onPressed: () => Navigator.of(context).pop(
            MultiTextFieldDialogEvent.neutral(
              _textFieldContents.map((textFieldContent) => MultiTextFieldDialogResult(textFieldContent.textEditingController.text, textFieldContent.defaultText)).toList(),
            ),
          ),
          child: Text(neutralButton!),
        ),
      );
    }
    if (positiveButton != null) {
      buttons.add(
        TextButton(
          onPressed: () => Navigator.of(context).pop(
            MultiTextFieldDialogEvent.positive(
              _textFieldContents.map((textFieldContent) => MultiTextFieldDialogResult(textFieldContent.textEditingController.text, textFieldContent.defaultText)).toList(),
            ),
          ),
          child: Text(positiveButton!),
        ),
      );
    }
    return AlertDialog(
      title: (title != null) ? Text(title!) : null,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: _textFieldContents.map((element) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return TextField(
                controller: element.textEditingController,
                autofocus: true,
                keyboardType: element.keyboardType,
                obscureText: element.isObscureText,
                decoration: InputDecoration(
                  labelText: element.labelText,
                  hintText: element.hintText,
                  suffixIcon: (element.keyboardType == TextInputType.visiblePassword)
                      ? IconButton(
                          icon: Icon(element.isObscureText ? Icons.visibility_off : Icons.visibility),
                          onPressed: () => setState(() => element.isObscureText = !element.isObscureText),
                        )
                      : null,
                ),
              );
            },
          );
        }).toList(),
      ),
      actions: buttons,
    );
  }
}

class TextFieldContent {
  TextFieldContent({this.labelText, this.hintText, this.defaultText, this.keyboardType = TextInputType.text}) : textEditingController = TextEditingController(text: defaultText) {
    if (keyboardType == TextInputType.visiblePassword) isObscureText = true;
  }

  final String? labelText;
  final String? hintText;
  final String? defaultText;
  final TextInputType keyboardType;
  final TextEditingController textEditingController;
  bool isObscureText = false;
}

class MultiTextFieldDialogResult {
  MultiTextFieldDialogResult(this.currentText, this.defaultText);

  final String currentText;
  final String? defaultText;
}
