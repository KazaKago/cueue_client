import 'package:cueue/presentation/view/hierarchy/main/main_navigation_items.dart';
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
    if (navigationItem.isVisibleFab()) {
      return FloatingActionButton.extended(
        label: Text(navigationItem.fabLabel ?? ''),
        onPressed: () => _goFabPage(context, navigationItem.fabPage!),
        icon: Icon(navigationItem.fabIcon),
      );
    } else {
      return null;
    }
  }

  Future<void> _goFabPage(BuildContext context, Widget page) async {
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => page));
  }
}
