import 'package:cueue/model/menu/menu_registration.dart';

abstract class CreateMenuUseCase {
  Future<void> call(MenuRegistration menuRegistration);
}
