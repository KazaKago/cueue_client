import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_user.dart';
import 'package:cueue/ui/hierarchy/main/main_page.dart';
import 'package:cueue/ui/hierarchy/welcome/user_creation_page.dart';
import 'package:cueue/ui/hierarchy/welcome/workspace_creation_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<void, void> useReplaceSignedInPage(WidgetRef ref) {
  final replacePage = useReplacePage();
  final userState = useUser(ref);
  final fireState = useState(false);
  useEffect(
    () {
      if (!fireState.value || userState.isValidating) return null;
      final user = userState.data;
      if (user == null) {
        replacePage.trigger(const UserCreationPage());
      } else if (user.workspace == null) {
        replacePage.trigger(const WorkspaceCreationPage());
      } else {
        replacePage.trigger(const MainPage());
      }
      fireState.value = false;
      return null;
    },
    [userState.data, userState.isValidating, fireState.value],
  );
  return useSWRTrigger((key) async {
    fireState.value = true;
  });
}
