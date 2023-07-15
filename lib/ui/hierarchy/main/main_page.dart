import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/ui/hierarchy/main/main_navigation_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({
    super.key,
    required this.currentIndex,
    required this.goBranch,
    required this.child,
  });

  final int currentIndex;
  final void Function(int index) goBranch;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final context = useContext();
    final mainNavigationItemList = MainNavigationItems(context);
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        destinations: mainNavigationItemList.toNavigationDestinationList(),
        onDestinationSelected: goBranch,
      ),
      floatingActionButton: _buildFloatingActionButton(context, mainNavigationItemList),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget? _buildFloatingActionButton(BuildContext context, MainNavigationItems mainNavigationItemList) {
    final goNamed = useGoNamed();
    final navigationItem = mainNavigationItemList[currentIndex];
    final fabPage = navigationItem.fabPage;
    if (fabPage != null) {
      return FloatingActionButton.extended(
        label: Text(navigationItem.fabLabel ?? ''),
        onPressed: () => goNamed.trigger(GoName(fabPage)),
        icon: Icon(navigationItem.fabIcon),
        heroTag: navigationItem.fabLabel,
      );
    } else {
      return null;
    }
  }
}
