import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_message_dialog_event.freezed.dart';

@freezed
class SimpleMessageDialogEvent with _$SimpleMessageDialogEvent {
  const factory SimpleMessageDialogEvent.positive() = _Positive;

  const factory SimpleMessageDialogEvent.neutral() = _Neutral;

  const factory SimpleMessageDialogEvent.negative() = _Negative;
}
