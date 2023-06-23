import 'dart:collection';

import 'package:cueue/ui/global/utils/intl.dart';
import 'package:cueue/ui/hierarchy/menu/menu_editing_page.dart';
import 'package:cueue/ui/hierarchy/menu/menu_page.dart';
import 'package:cueue/ui/hierarchy/mypage/my_page.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_editing_page.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_page.dart';
import 'package:cueue/ui/hierarchy/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationItems extends ListBase<MainNavigationItem> {
  factory MainNavigationItems(BuildContext context) {
    final rawList = [
      MainNavigationItem(const MenuPage(), intl(context).cookingMenu, FontAwesomeIcons.calendar, fabPage: MenuEditingPage(), fabIcon: Icons.add, fabLabel: intl(context).addCookingMenu),
      MainNavigationItem(const RecipePage(), intl(context).recipe, FontAwesomeIcons.utensils, fabPage: const RecipeEditingPage(), fabIcon: Icons.add, fabLabel: intl(context).addRecipe),
      MainNavigationItem(const SearchPage(), intl(context).search, FontAwesomeIcons.magnifyingGlass),
      MainNavigationItem(const MyPage(), intl(context).mypage, Icons.account_circle),
    ];
    return MainNavigationItems._(rawList);
  }

  MainNavigationItems._(this.rawList);

  final List<MainNavigationItem> rawList;

  @override
  int get length => rawList.length;

  @override
  set length(int newLength) {
    rawList.length = newLength;
  }

  @override
  MainNavigationItem operator [](int index) => rawList[index];

  @override
  void operator []=(int index, MainNavigationItem value) {
    rawList[index] = value;
  }

  List<Widget> toPageList() {
    return map((item) => item.page).toList();
  }

  List<NavigationDestination> toNavigationDestinationList() {
    return map((item) => item.toNavigationDestination()).toList();
  }
}

class MainNavigationItem {
  const MainNavigationItem(this.page, this.title, this.icon, {this.fabPage, this.fabIcon, this.fabLabel});

  final Widget page;
  final String title;
  final IconData icon;
  final Widget? fabPage;
  final IconData? fabIcon;
  final String? fabLabel;

  NavigationDestination toNavigationDestination() {
    return NavigationDestination(
      icon: Icon(icon),
      label: title,
    );
  }

  bool isVisibleFab() {
    return fabPage != null;
  }
}
