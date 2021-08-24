import 'package:cueue/domain/model/hierarchy/menu/menu.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class FollowMenuUseCase {
  LoadingStateStream<Menu> call(final MenuId menuId);
}
