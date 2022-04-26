import 'package:cueue/domain/model/hierarchy/menu/menu_registration.dart';

abstract class CreateMenuUseCase {
  Future<void> call(MenuRegistration menuRegistration);
}
