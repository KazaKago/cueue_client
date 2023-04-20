import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_firebase_user.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_user.dart';
import 'package:cueue/model/exception/not_found_exception.dart';
import 'package:cueue/model/user/user.dart';
import 'package:cueue/ui/hierarchy/auth/authentication_page.dart';
import 'package:cueue/ui/hierarchy/main/main_page.dart';
import 'package:cueue/ui/hierarchy/welcome/user_creation_page.dart';
import 'package:cueue/ui/hierarchy/welcome/workspace_creation_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRState<String, User> useCheckAtLaunch(WidgetRef ref) {
  final firebaseUserState = useFirebaseUser(ref);
  final userState = useUser(ref);
  final replacePage = useReplacePage();
  useEffect(
    () {
      final user = userState.data;
      final error = userState.error;
      if (firebaseUserState.data == null) {
        replacePage.trigger(const AuthenticationPage());
      } else if (user != null) {
        if (user.workspace != null) {
          replacePage.trigger(const MainPage());
        } else {
          replacePage.trigger(const WorkspaceCreationPage());
        }
      } else if (error != null) {
        if (error is NotFoundException) {
          replacePage.trigger(const UserCreationPage());
        }
      }
      return null;
    },
    [userState.data, userState.error],
  );
  return userState;
}
