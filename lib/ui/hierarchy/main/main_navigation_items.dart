import 'dart:collection';

import 'package:cueue/ui/global/utils/intl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationItems extends ListBase<MainNavigationItem> {
  factory MainNavigationItems(BuildContext context) {
    final rawList = [
      MainNavigationItem(intl(context).cookingMenu, FontAwesomeIcons.calendar, fabPage: 'menu_new', fabIcon: Icons.add, fabLabel: intl(context).addCookingMenu),
      MainNavigationItem(intl(context).recipe, FontAwesomeIcons.utensils, fabPage: 'recipe_new', fabIcon: Icons.add, fabLabel: intl(context).addRecipe),
      MainNavigationItem(intl(context).search, FontAwesomeIcons.magnifyingGlass),
      MainNavigationItem(intl(context).mypage, Icons.account_circle),
    ];
    return MainNavigationItems._(context, rawList);
  }

  MainNavigationItems._(this.context, this.rawList);

  final BuildContext context;
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

  List<NavigationDestination> toNavigationDestinationList() {
    return map((item) => item.toNavigationDestination()).toList();
  }
}

class MainNavigationItem {
  const MainNavigationItem(this.title, this.icon, {this.fabPage, this.fabIcon, this.fabLabel});

  final String title;
  final IconData icon;
  final String? fabPage;
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
