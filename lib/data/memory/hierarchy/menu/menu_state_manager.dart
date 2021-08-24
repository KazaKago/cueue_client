import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:store_flowable/store_flowable.dart';

class MenuStateManager extends FlowableDataStateManager<MenuId> {
  static MenuStateManager sharedInstance = MenuStateManager();
}
