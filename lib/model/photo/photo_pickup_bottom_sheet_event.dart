import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_pickup_bottom_sheet_event.freezed.dart';

@freezed
class PhotoPickupBottomSheetEvent with _$PhotoPickupBottomSheetEvent {
  const factory PhotoPickupBottomSheetEvent.fromCamera() = _FromCamera;

  const factory PhotoPickupBottomSheetEvent.fromLibrary() = _FromLibrary;

  const factory PhotoPickupBottomSheetEvent.cancel() = _Cancel;
}
