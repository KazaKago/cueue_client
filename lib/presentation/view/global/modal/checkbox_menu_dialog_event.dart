import 'package:cueue/presentation/view/global/modal/checkbox_menu_dialog.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkbox_menu_dialog_event.freezed.dart';

@freezed
class CheckedMenuDialogEvent with _$CheckedMenuDialogEvent {
  const factory CheckedMenuDialogEvent.positive(List<CheckedMenuItem> menuItems) = _Positive;

  const factory CheckedMenuDialogEvent.negative(List<CheckedMenuItem> menuItems) = _Negative;
}
