import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_registration.dart';
import 'package:cueue/domain/repository/hierarchy/menu/menu_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/menu/update_menu_usecase.dart';

class UpdateMenuUseCaseImpl implements UpdateMenuUseCase {
  const UpdateMenuUseCaseImpl(this._menuRepository);

  final MenuRepository _menuRepository;

  @override
  Future<void> call(MenuId menuId, MenuRegistration menuRegistration) {
    return _menuRepository.update(menuId, menuRegistration);
  }
}
