import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';

abstract class RefreshMenuUseCase {
  Future<void> call(MenuId menuId);
}
