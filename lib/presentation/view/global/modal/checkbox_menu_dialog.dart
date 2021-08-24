import 'package:cueue/presentation/view/global/modal/checkbox_menu_dialog_event.dart';
import 'package:flutter/material.dart';

class CheckedMenuDialog {
  const CheckedMenuDialog(this._context, this._menuItems, {this.title, this.positiveButton, this.negativeButton});

  final BuildContext _context;
  final List<CheckedMenuItem> _menuItems;
  final String? title;
  final String? positiveButton;
  final String? negativeButton;

  Future<CheckedMenuDialogEvent?> show() {
    final buttons = <Widget>[];
    if (negativeButton != null) {
      buttons.add(TextButton(
        onPressed: () => Navigator.of(_context).pop(CheckedMenuDialogEvent.negative(_menuItems)),
        child: Text(negativeButton!),
      ));
    }
    if (positiveButton != null) {
      buttons.add(TextButton(
        onPressed: () => Navigator.of(_context).pop(CheckedMenuDialogEvent.positive(_menuItems)),
        child: Text(positiveButton!),
      ));
    }
    return showDialog<CheckedMenuDialogEvent?>(
      context: _context,
      builder: (context) {
        return AlertDialog(
          title: (title != null) ? Text(title!) : null,
          contentPadding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          actions: buttons,
          content: SizedBox(
            width: double.maxFinite,
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Scrollbar(
                  child: ListView(
                    shrinkWrap: true,
                    children: _menuItems.map((menuItem) {
                      return CheckboxListTile(
                        title: Text(menuItem.title),
                        value: menuItem.isChecked,
                        onChanged: (bool? value) {
                          if (value == null) return;
                          setState(() {
                            menuItem.isChecked = value;
                          });
                        },
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class CheckedMenuItem {
  CheckedMenuItem(this.title, {required this.isChecked});

  final String title;
  bool isChecked;
}
