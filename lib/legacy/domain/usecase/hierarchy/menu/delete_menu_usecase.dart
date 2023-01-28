import 'package:cueue/model/menu/menu_id.dart';

abstract class DeleteMenuUseCase {
  Future<void> call(MenuId menuId);
}
