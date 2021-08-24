import 'package:cueue/presentation/view/global/modal/menu_bottom_sheet_dialog.dart';
import 'package:cueue/presentation/view/hierarchy/photo/photo_pickup_bottom_sheet_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PhotoPickupBottomSheetDialog {
  factory PhotoPickupBottomSheetDialog(final BuildContext context) {
    final menuItemEvents = <_MenuItemEvent>[
      _MenuItemEvent(MenuItem(Icons.camera, AppLocalizations.of(context)!.takePhoto), const PhotoPickupBottomSheetEvent.fromCamera()),
      _MenuItemEvent(MenuItem(Icons.photo, AppLocalizations.of(context)!.chooseFromLibrary), const PhotoPickupBottomSheetEvent.fromLibrary()),
      _MenuItemEvent(MenuItem(Icons.close, AppLocalizations.of(context)!.close), const PhotoPickupBottomSheetEvent.cancel()),
    ];
    final menuBottomSheetDialog = MenuBottomSheetDialog(context, menuItemEvents.map((e) => e.menuItem).toList());
    return PhotoPickupBottomSheetDialog._(menuItemEvents, menuBottomSheetDialog);
  }

  PhotoPickupBottomSheetDialog._(this._menuItemEvents, this._menuBottomSheetDialog);

  final List<_MenuItemEvent> _menuItemEvents;
  final MenuBottomSheetDialog _menuBottomSheetDialog;

  Future<PhotoPickupBottomSheetEvent?> show() async {
    final result = await _menuBottomSheetDialog.show();
    if (result != null) {
      return _menuItemEvents[result.index].event;
    } else {
      return null;
    }
  }
}

class _MenuItemEvent {
  const _MenuItemEvent(this.menuItem, this.event);

  final MenuItem menuItem;
  final PhotoPickupBottomSheetEvent event;
}
