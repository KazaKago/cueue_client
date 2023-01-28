import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_user.dart';
import 'package:cueue/hooks/hierarchy/setting/use_link_with_google.dart';
import 'package:cueue/hooks/hierarchy/setting/use_unlink_with_google.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<void, void> useToggleWithGoogle(WidgetRef ref) {
  final userState = useUser(ref);
  final linkWithGoogle = useLinkWithGoogle(ref);
  final unlinkWithGoogle = useUnlinkWithGoogle(ref);
  return useSWRTrigger<void, void>((_) {
    if (userState.data?.isGoogleLinked() == true) {
      return unlinkWithGoogle.trigger(null);
    } else {
      return linkWithGoogle.trigger(null);
    }
  });
}
