import 'dart:collection';

import 'package:cueue/presentation/view/hierarchy/menu/menu_editing_page.dart';
import 'package:cueue/presentation/view/hierarchy/menu/menu_page.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_editing_page.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_page.dart';
import 'package:cueue/presentation/view/hierarchy/setting/settings_page.dart';
import 'package:cueue/presentation/view/hierarchy/tag/tag_editing_page.dart';
import 'package:cueue/presentation/view/hierarchy/tag/tag_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationItem {
  const MainNavigationItem(this.page, this.title, this.icon, {this.fabPage, this.fabIcon, this.fabLabel});

  final Widget page;
  final String title;
  final IconData icon;
  final Widget? fabPage;
  final IconData? fabIcon;
  final String? fabLabel;

  BottomNavigationBarItem toBottomNavigationBarItem() {
    return BottomNavigationBarItem(icon: Icon(icon), label: title);
  }

  bool isVisibleFab() {
    return fabPage != null;
  }
}

class MainNavigationItemList extends ListBase<MainNavigationItem> {
  factory MainNavigationItemList(final BuildContext context) {
    final rawList = [
      MainNavigationItem(const MenuPage(), AppLocalizations.of(context)!.cookingMenu, FontAwesomeIcons.calendar, fabPage: MenuEditingPage(), fabIcon: Icons.add, fabLabel: AppLocalizations.of(context)!.addCookingMenu),
      MainNavigationItem(const RecipePage(), AppLocalizations.of(context)!.recipe, FontAwesomeIcons.utensils, fabPage: const RecipeEditingPage(), fabIcon: Icons.add, fabLabel: AppLocalizations.of(context)!.addRecipe),
      MainNavigationItem(const TagPage(), AppLocalizations.of(context)!.tag, FontAwesomeIcons.tag, fabPage: const TagEditingPage(), fabIcon: Icons.add, fabLabel: AppLocalizations.of(context)!.addTag),
      MainNavigationItem(const SettingsPage(), AppLocalizations.of(context)!.settings, Icons.settings),
    ];
    return MainNavigationItemList._(rawList);
  }

  MainNavigationItemList._(this.rawList);

  final List<MainNavigationItem> rawList;

  @override
  int get length => rawList.length;

  @override
  set length(final int newLength) {
    rawList.length = newLength;
  }

  @override
  MainNavigationItem operator [](final int index) => rawList[index];

  @override
  void operator []=(final int index, final MainNavigationItem value) {
    rawList[index] = value;
  }

  List<Widget> toPageList() {
    return map((item) => item.page).toList();
  }

  List<BottomNavigationBarItem> toBottomNavigationBarItemList() {
    return map((item) => item.toBottomNavigationBarItem()).toList();
  }
}
