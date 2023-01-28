import 'package:cueue/model/menu/menu_id.dart';
import 'package:cueue/model/menu/menu_registration.dart';

abstract class UpdateMenuUseCase {
  Future<void> call(MenuId menuId, MenuRegistration menuRegistration);
}
