import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/model/photo/photo_pickup_bottom_sheet_event.dart';
import 'package:cueue/ui/global/modal/menu_bottom_sheet_dialog.dart';
import 'package:cueue/ui/global/utils/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

SWRTriggerState<void, PhotoPickupBottomSheetEvent?> usePhotoPickupBottomSheetDialog() {
  final context = useContext();
  return useSWRTrigger((data) {
    return showModalBottomSheet<PhotoPickupBottomSheetEvent>(
      context: context,
      builder: PhotoPickupBottomSheetDialog.new,
    );
  });
}

class PhotoPickupBottomSheetDialog extends MenuBottomSheetDialog {
  factory PhotoPickupBottomSheetDialog(BuildContext context) {
    final menuItemEvents = <_MenuValueEvent>[
      _MenuValueEvent(MenuValue(Icons.camera, intl(context).takePhoto), const PhotoPickupBottomSheetEvent.fromCamera()),
      _MenuValueEvent(MenuValue(Icons.photo, intl(context).chooseFromLibrary), const PhotoPickupBottomSheetEvent.fromLibrary()),
      _MenuValueEvent(MenuValue(Icons.close, intl(context).close), const PhotoPickupBottomSheetEvent.cancel()),
    ];
    return PhotoPickupBottomSheetDialog._(menuItemEvents, menuItemEvents.map((e) => e.menuItem).toList());
  }

  const PhotoPickupBottomSheetDialog._(this._menuItemEvents, super.menuItems);

  final List<_MenuValueEvent> _menuItemEvents;

  @override
  void onTap(BuildContext context, MenuItemResult result) {
    Navigator.of(context).pop(_menuItemEvents[result.index].event);
  }
}

class _MenuValueEvent {
  const _MenuValueEvent(this.menuItem, this.event);

  final MenuValue menuItem;
  final PhotoPickupBottomSheetEvent event;
}
