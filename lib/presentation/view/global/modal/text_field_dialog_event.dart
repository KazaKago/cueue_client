import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_field_dialog_event.freezed.dart';

@freezed
class TextFieldDialogEvent with _$TextFieldDialogEvent {
  const factory TextFieldDialogEvent.positive(final String currentText, {final String? originalText}) = _Positive;

  const factory TextFieldDialogEvent.neutral(final String currentText, {final String? originalText}) = _Neutral;

  const factory TextFieldDialogEvent.negative(final String currentText, {final String? originalText}) = _Negative;
}
