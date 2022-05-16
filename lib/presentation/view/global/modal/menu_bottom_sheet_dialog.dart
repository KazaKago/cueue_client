import 'package:flutter/material.dart';

class MenuBottomSheetDialog {
  const MenuBottomSheetDialog(this._context, this._menuItems);

  final BuildContext _context;
  final List<MenuValue> _menuItems;

  Future<MenuItemResult?> show() {
    return showModalBottomSheet(
      context: _context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: _menuItems.map<Widget>((menuItem) {
            return ListTile(
              leading: Icon(menuItem.icon),
              title: Text(menuItem.title),
              onTap: () => Navigator.of(context).pop(MenuItemResult(_menuItems.indexOf(menuItem), menuItem)),
            );
          }).toList(),
        );
      },
    );
  }
}

class MenuValue {
  const MenuValue(this.icon, this.title);

  final IconData icon;
  final String title;
}

class MenuItemResult {
  const MenuItemResult(this.index, this.menuItem);

  final int index;
  final MenuValue menuItem;
}
