import 'package:cueue/legacy/domain/repository/hierarchy/menu/menu_repository.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/menu/refresh_menu_usecase.dart';
import 'package:cueue/model/menu/menu_id.dart';

class RefreshMenuUseCaseImpl implements RefreshMenuUseCase {
  const RefreshMenuUseCaseImpl(this._menuRepository);

  final MenuRepository _menuRepository;

  @override
  Future<void> call(MenuId menuId) {
    return _menuRepository.refreshData(menuId);
  }
}
