import 'package:cueue/model/menu/menu_id.dart';

abstract class RefreshMenuUseCase {
  Future<void> call(MenuId menuId);
}
