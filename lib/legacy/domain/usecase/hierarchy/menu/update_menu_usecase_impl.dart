import 'package:cueue/legacy/domain/repository/hierarchy/menu/menu_repository.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/menu/update_menu_usecase.dart';
import 'package:cueue/model/menu/menu_id.dart';
import 'package:cueue/model/menu/menu_registration.dart';

class UpdateMenuUseCaseImpl implements UpdateMenuUseCase {
  const UpdateMenuUseCaseImpl(this._menuRepository);

  final MenuRepository _menuRepository;

  @override
  Future<void> call(MenuId menuId, MenuRegistration menuRegistration) {
    return _menuRepository.update(menuId, menuRegistration);
  }
}
