import 'package:cueue/presentation/view/hierarchy/main/main_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final currentIndex = useState(0);
    final mainNavigationItemList = useState(MainNavigationItemList(context)).value;
    return Scaffold(
      body: IndexedStack(
        index: currentIndex.value,
        children: mainNavigationItemList.toPageList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (page) => currentIndex.value = page,
        currentIndex: currentIndex.value,
        type: BottomNavigationBarType.fixed,
        items: mainNavigationItemList.toBottomNavigationBarItemList(),
      ),
      floatingActionButton: _buildFloatingActionButton(context, currentIndex.value, mainNavigationItemList),
    );
  }

  Widget? _buildFloatingActionButton(final BuildContext context, final int currentIndex, final MainNavigationItemList mainNavigationItemList) {
    final navigationItem = mainNavigationItemList[currentIndex];
    if (navigationItem.isVisibleFab()) {
      return FloatingActionButton(
        tooltip: navigationItem.fabLabel,
        onPressed: () => _goFabPage(context, navigationItem.fabPage!),
        child: Icon(navigationItem.fabIcon),
      );
    } else {
      return null;
    }
  }

  Future<void> _goFabPage(final BuildContext context, final Widget page) async {
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => page));
  }
}
