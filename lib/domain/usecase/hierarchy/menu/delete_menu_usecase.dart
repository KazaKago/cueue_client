import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';

abstract class DeleteMenuUseCase {
  Future<void> call(MenuId menuId);
}
