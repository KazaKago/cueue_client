import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_user.dart';
import 'package:cueue/hooks/hierarchy/setting/use_link_with_apple.dart';
import 'package:cueue/hooks/hierarchy/setting/use_unlink_with_apple.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<void, void> useToggleWithApple(WidgetRef ref) {
  final userState = useUser(ref);
  final linkWithApple = useLinkWithApple(ref);
  final unlinkWithApple = useUnlinkWithApple(ref);
  return useSWRTrigger<void, void>((_) {
    if (userState.data?.isAppleLinked() == true) {
      return unlinkWithApple.trigger(null);
    } else {
      return linkWithApple.trigger(null);
    }
  });
}
