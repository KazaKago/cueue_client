import 'package:cueue/domain/model/hierarchy/menu/menu_list.dart';
import 'package:cueue/domain/repository/hierarchy/menu/menu_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/menu/follow_all_menus_usecase.dart';
import 'package:store_flowable/store_flowable_core.dart';

class FollowAllMenusUseCaseImpl implements FollowAllMenusUseCase {
  const FollowAllMenusUseCaseImpl(this._menuRepository);

  final MenuRepository _menuRepository;

  @override
  LoadingStateStream<MenuList> call() {
    return _menuRepository.followAllData().mapContent(MenuList.new);
  }
}
