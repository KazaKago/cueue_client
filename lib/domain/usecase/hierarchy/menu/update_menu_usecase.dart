import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_registration.dart';

abstract class UpdateMenuUseCase {
  Future<void> call(MenuId menuId, MenuRegistration menuRegistration);
}
