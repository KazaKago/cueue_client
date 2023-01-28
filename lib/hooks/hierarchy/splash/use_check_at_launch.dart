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
  final replaceAuthenticationPage = useReplaceAuthenticationPage();
  final replaceUserCreationPage = useReplaceUserCreationPage();
  final replaceWorkspaceCreationPage = useReplaceWorkspaceCreationPage();
  final replaceMainPage = useReplaceMainPage();
  useEffect(
    () {
      final user = userState.data;
      final error = userState.error;
      if (firebaseUserState.data == null) {
        replaceAuthenticationPage.trigger(null);
      } else if (user != null) {
        if (user.workspace != null) {
          replaceMainPage.trigger(null);
        } else {
          replaceWorkspaceCreationPage.trigger(null);
        }
      } else if (error != null) {
        if (error is NotFoundException) {
          replaceUserCreationPage.trigger(null);
        }
      }
      return null;
    },
    [userState.data, userState.error],
  );
  return userState;
}
