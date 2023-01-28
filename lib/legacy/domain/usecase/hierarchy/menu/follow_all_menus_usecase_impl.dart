import 'package:cueue/legacy/domain/repository/hierarchy/menu/menu_repository.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/menu/follow_all_menus_usecase.dart';
import 'package:cueue/model/menu/menu_list.dart';
import 'package:store_flowable/store_flowable_core.dart';

class FollowAllMenusUseCaseImpl implements FollowAllMenusUseCase {
  const FollowAllMenusUseCaseImpl(this._menuRepository);

  final MenuRepository _menuRepository;

  @override
  LoadingStateStream<MenuList> call() {
    return _menuRepository.followAllData().mapContent(MenuList.new);
  }
}
