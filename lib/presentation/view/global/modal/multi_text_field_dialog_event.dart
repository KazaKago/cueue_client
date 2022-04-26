import 'package:cueue/presentation/view/global/modal/multi_text_field_dialog.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'multi_text_field_dialog_event.freezed.dart';

@freezed
class MultiTextFieldDialogEvent with _$MultiTextFieldDialogEvent {
  const factory MultiTextFieldDialogEvent.positive(List<MultiTextFieldDialogResult> results) = _Positive;

  const factory MultiTextFieldDialogEvent.neutral(List<MultiTextFieldDialogResult> results) = _Neutral;

  const factory MultiTextFieldDialogEvent.negative(List<MultiTextFieldDialogResult> results) = _Negative;
}
