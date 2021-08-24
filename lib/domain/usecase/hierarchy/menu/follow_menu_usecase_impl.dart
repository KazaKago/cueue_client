import 'package:cueue/domain/model/hierarchy/menu/menu.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:cueue/domain/repository/hierarchy/menu/menu_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/menu/follow_menu_usecase.dart';
import 'package:store_flowable/store_flowable_core.dart';

class FollowMenuUseCaseImpl implements FollowMenuUseCase {
  const FollowMenuUseCaseImpl(this._menuRepository);

  final MenuRepository _menuRepository;

  @override
  LoadingStateStream<Menu> call(final MenuId menuId) {
    return _menuRepository.followData(menuId);
  }
}
