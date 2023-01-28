import 'package:cueue/legacy/domain/repository/hierarchy/menu/menu_repository.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/menu/delete_menu_usecase.dart';
import 'package:cueue/model/menu/menu_id.dart';

class DeleteMenuUseCaseImpl implements DeleteMenuUseCase {
  const DeleteMenuUseCaseImpl(this._menuRepository);

  final MenuRepository _menuRepository;

  @override
  Future<void> call(MenuId menuId) {
    return _menuRepository.delete(menuId);
  }
}
