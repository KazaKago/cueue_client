import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:cueue/domain/repository/hierarchy/menu/menu_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/menu/delete_menu_usecase.dart';

class DeleteMenuUseCaseImpl implements DeleteMenuUseCase {
  const DeleteMenuUseCaseImpl(this._menuRepository);

  final MenuRepository _menuRepository;

  @override
  Future<void> call(MenuId menuId) {
    return _menuRepository.delete(menuId);
  }
}
