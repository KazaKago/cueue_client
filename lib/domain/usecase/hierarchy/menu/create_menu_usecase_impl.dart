import 'package:cueue/domain/model/hierarchy/menu/menu_registration.dart';
import 'package:cueue/domain/repository/hierarchy/menu/menu_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/menu/create_menu_usecase.dart';

class CreateMenuUseCaseImpl implements CreateMenuUseCase {
  const CreateMenuUseCaseImpl(this._menuRepository);

  final MenuRepository _menuRepository;

  @override
  Future<void> call(MenuRegistration menuRegistration) {
    return _menuRepository.create(menuRegistration);
  }
}
