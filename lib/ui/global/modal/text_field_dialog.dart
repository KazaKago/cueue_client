import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/ui/global/modal/text_field_dialog_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TextFieldDialogData {
  TextFieldDialogData({this.title, this.defaultText, this.keyboardType = TextInputType.text, this.positiveButton, this.negativeButton});

  final String? title;
  final String? defaultText;
  final TextInputType keyboardType;
  final String? positiveButton;
  final String? negativeButton;
}

SWRTriggerState<TextFieldDialogData, TextFieldDialogEvent?> useTextFieldDialog() {
  final context = useContext();
  return useSWRTrigger((data) {
    return showDialog<TextFieldDialogEvent>(
      context: context,
      builder: (context) => TextFieldDialog(
        title: data.title,
        defaultText: data.defaultText,
        keyboardType: data.keyboardType,
        positiveButton: data.positiveButton,
        negativeButton: data.negativeButton,
      ),
    );
  });
}

class TextFieldDialog extends HookConsumerWidget {
  const TextFieldDialog({super.key, this.title, this.message, this.labelText, this.hintText, this.defaultText, this.keyboardType = TextInputType.text, this.positiveButton, this.neutralButton, this.negativeButton});

  final String? title;
  final String? message;
  final String? labelText;
  final String? hintText;
  final String? defaultText;
  final TextInputType keyboardType;
  final String? positiveButton;
  final String? neutralButton;
  final String? negativeButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscureText = useState(keyboardType == TextInputType.visiblePassword);
    final textEditingController = useTextEditingController(text: defaultText);
    final buttons = <Widget>[];
    if (negativeButton != null) {
      buttons.add(
        TextButton(
          onPressed: () => Navigator.of(context).pop(TextFieldDialogEvent.negative(textEditingController.text, originalText: defaultText)),
          child: Text(negativeButton!),
        ),
      );
    }
    if (neutralButton != null) {
      buttons.add(
        TextButton(
          onPressed: () => Navigator.of(context).pop(TextFieldDialogEvent.neutral(textEditingController.text, originalText: defaultText)),
          child: Text(neutralButton!),
        ),
      );
    }
    if (positiveButton != null) {
      buttons.add(
        TextButton(
          onPressed: () => Navigator.of(context).pop(TextFieldDialogEvent.positive(textEditingController.text, originalText: defaultText)),
          child: Text(positiveButton!),
        ),
      );
    }
    return AlertDialog(
      title: (title != null) ? Text(title!) : null,
      content: TextField(
        controller: textEditingController,
        autofocus: true,
        keyboardType: keyboardType,
        obscureText: isObscureText.value,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          suffixIcon: (keyboardType == TextInputType.visiblePassword)
              ? IconButton(
                  icon: Icon(isObscureText.value ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => isObscureText.value = !isObscureText.value,
                )
              : null,
        ),
      ),
      actions: buttons,
    );
  }
}
