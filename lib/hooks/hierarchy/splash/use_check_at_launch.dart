import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_firebase_user.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_user.dart';
import 'package:cueue/model/exception/not_found_exception.dart';
import 'package:cueue/model/user/user.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRState<String, User> useCheckAtLaunch(WidgetRef ref) {
  final firebaseUserState = useFirebaseUser(ref);
  final userState = useUser(ref);
  final goNamed = useGoNamed();
  useEffect(
    () {
      final user = userState.data;
      final error = userState.error;
      if (firebaseUserState.data == null) {
        goNamed.trigger(GoName('authentication'));
      } else if (user != null) {
        if (user.workspace != null) {
          goNamed.trigger(GoName('root'));
        } else {
          goNamed.trigger(GoName('workspace_creation'));
        }
      } else if (error != null) {
        if (error is NotFoundException) {
          goNamed.trigger(GoName('user_creation'));
        }
      }
      return null;
    },
    [userState.data, userState.error],
  );
  return userState;
}
