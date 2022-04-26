import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_field_dialog_event.freezed.dart';

@freezed
class TextFieldDialogEvent with _$TextFieldDialogEvent {
  const factory TextFieldDialogEvent.positive(String currentText, {String? originalText}) = _Positive;

  const factory TextFieldDialogEvent.neutral(String currentText, {String? originalText}) = _Neutral;

  const factory TextFieldDialogEvent.negative(String currentText, {String? originalText}) = _Negative;
}
