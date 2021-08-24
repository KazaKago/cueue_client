import 'package:store_flowable/store_flowable.dart';

class UserStateManager extends FlowableDataStateManager<void> {
  static UserStateManager sharedInstance = UserStateManager();
}
