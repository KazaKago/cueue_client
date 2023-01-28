import 'package:cueue/legacy/domain/repository/hierarchy/menu/menu_repository.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/menu/follow_menu_usecase.dart';
import 'package:cueue/model/menu/menu.dart';
import 'package:cueue/model/menu/menu_id.dart';
import 'package:store_flowable/store_flowable_core.dart';

class FollowMenuUseCaseImpl implements FollowMenuUseCase {
  const FollowMenuUseCaseImpl(this._menuRepository);

  final MenuRepository _menuRepository;

  @override
  LoadingStateStream<Menu> call(MenuId menuId) {
    return _menuRepository.followData(menuId);
  }
}
