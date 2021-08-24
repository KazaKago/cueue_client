import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:cueue/domain/repository/hierarchy/menu/menu_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/menu/refresh_menu_usecase.dart';

class RefreshMenuUseCaseImpl implements RefreshMenuUseCase {
  const RefreshMenuUseCaseImpl(this._menuRepository);

  final MenuRepository _menuRepository;

  @override
  Future<void> call(final MenuId menuId) {
    return _menuRepository.refreshData(menuId);
  }
}
