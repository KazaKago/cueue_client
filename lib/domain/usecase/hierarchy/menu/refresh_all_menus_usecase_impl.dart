import 'package:cueue/domain/repository/hierarchy/menu/menu_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/menu/refresh_all_menus_usecase.dart';

class RefreshAllMenusUseCaseImpl implements RefreshAllMenusUseCase {
  const RefreshAllMenusUseCaseImpl(this._menuRepository);

  final MenuRepository _menuRepository;

  @override
  Future<void> call() {
    return _menuRepository.refreshAllData();
  }
}
