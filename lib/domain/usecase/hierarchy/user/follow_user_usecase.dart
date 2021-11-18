import 'package:cueue/domain/model/hierarchy/user/user.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class FollowUserUseCase {
  LoadingStateStream<User> call();
}
