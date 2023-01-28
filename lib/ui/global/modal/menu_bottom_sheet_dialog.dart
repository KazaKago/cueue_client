import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuBottomSheetDialog extends HookConsumerWidget {
  const MenuBottomSheetDialog(this.menuItems, {super.key});

  final List<MenuValue> menuItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: menuItems.map<Widget>((menuItem) {
        return ListTile(
          leading: Icon(menuItem.icon),
          title: Text(menuItem.title),
          onTap: () => onTap(context, MenuItemResult(menuItems.indexOf(menuItem), menuItem)),
        );
      }).toList(),
    );
  }

  void onTap(BuildContext context, MenuItemResult result) {
    Navigator.of(context).pop(result);
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
