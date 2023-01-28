import 'package:cueue/legacy/domain/repository/hierarchy/menu/menu_repository.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/menu/create_menu_usecase.dart';
import 'package:cueue/model/menu/menu_registration.dart';

class CreateMenuUseCaseImpl implements CreateMenuUseCase {
  const CreateMenuUseCaseImpl(this._menuRepository);

  final MenuRepository _menuRepository;

  @override
  Future<void> call(MenuRegistration menuRegistration) {
    return _menuRepository.create(menuRegistration);
  }
}
