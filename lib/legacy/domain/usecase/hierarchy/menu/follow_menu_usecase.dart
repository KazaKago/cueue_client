import 'package:cueue/model/menu/menu.dart';
import 'package:cueue/model/menu/menu_id.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class FollowMenuUseCase {
  LoadingStateStream<Menu> call(MenuId menuId);
}
