import 'package:cueue/domain/model/hierarchy/menu/menu_list.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class FollowAllMenusUseCase {
  Future<LoadingStateStream<MenuList>> call();
}
