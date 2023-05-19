import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/ui/hierarchy/main/main_navigation_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);
    final mainNavigationItemList = useState(MainNavigationItems(context)).value;
    return Scaffold(
      body: IndexedStack(
        index: currentIndex.value,
        children: mainNavigationItemList.toPageList(),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex.value,
        destinations: mainNavigationItemList.toNavigationDestinationList(),
        onDestinationSelected: (page) => currentIndex.value = page,
      ),
      floatingActionButton: _buildFloatingActionButton(context, currentIndex.value, mainNavigationItemList),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget? _buildFloatingActionButton(BuildContext context, int currentIndex, MainNavigationItems mainNavigationItemList) {
    final navigationItem = mainNavigationItemList[currentIndex];
    final pushPage = usePushPage<void>();
    if (navigationItem.isVisibleFab()) {
      return FloatingActionButton.extended(
        label: Text(navigationItem.fabLabel ?? ''),
        onPressed: () => pushPage.trigger(navigationItem.fabPage!),
        icon: Icon(navigationItem.fabIcon),
        heroTag: navigationItem.fabLabel,
      );
    } else {
      return null;
    }
  }
}
