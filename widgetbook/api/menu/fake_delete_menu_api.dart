import 'package:cueue/api/hierarchy/menu/delete_menu_api.dart';

class FakeDeleteMenuApi implements DeleteMenuApi {
  const FakeDeleteMenuApi();

  @override
  Future<void> call(int menuId) async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}
