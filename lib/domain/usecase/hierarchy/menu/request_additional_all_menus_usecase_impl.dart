import 'package:cueue/domain/repository/hierarchy/menu/menu_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/menu/request_additional_all_menus_usecase.dart';

class RequestAdditionalAllMenusUseCaseImpl implements RequestAdditionalAllMenusUseCase {
  const RequestAdditionalAllMenusUseCaseImpl(this._menuRepository);

  final MenuRepository _menuRepository;

  @override
  Future<void> call({required final bool continueWhenError}) {
    return _menuRepository.requestAdditionalAllData(continueWhenError: continueWhenError);
  }
}
