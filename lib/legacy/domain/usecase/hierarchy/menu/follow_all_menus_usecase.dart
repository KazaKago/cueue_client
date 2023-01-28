import 'package:cueue/model/menu/menu_list.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class FollowAllMenusUseCase {
  LoadingStateStream<MenuList> call();
}
