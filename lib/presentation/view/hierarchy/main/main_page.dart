import 'package:cueue/presentation/view/hierarchy/main/main_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget? _buildFloatingActionButton(BuildContext context, int currentIndex, MainNavigationItemList mainNavigationItemList) {
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
