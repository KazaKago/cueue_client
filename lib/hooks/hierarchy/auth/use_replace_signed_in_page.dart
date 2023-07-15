import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_user.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<void, void> useReplaceSignedInPage(WidgetRef ref) {
  final goNamed = useGoNamed();
  final userState = useUser(ref);
  final fireState = useState(false);
  useEffect(
    () {
      if (!fireState.value || userState.isValidating) return null;
      final user = userState.data;
      if (user == null) {
        goNamed.trigger(GoName('user_creation'));
      } else if (user.workspace == null) {
        goNamed.trigger(GoName('workspace_creation'));
      } else {
        goNamed.trigger(GoName('root'));
      }
      fireState.value = false;
      return null;
    },
    [userState.data, userState.isValidating, fireState.value],
  );
  return useSWRTrigger((key) async {
    await userState.mutate(null);
    fireState.value = true;
  });
}
