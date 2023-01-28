import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/model/invitation/invitation_code.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:cueue/ui/global/modal/fried_toast.dart';
import 'package:flutter/services.dart';

SWRTriggerState<InvitationCode, void> useSetInvitationCodeToClipboard() {
  final intl = useIntl();
  final showFriedToast = useShowFriedToast();
  return useSWRTrigger<InvitationCode, void>((code) async {
    await Clipboard.setData(ClipboardData(text: code.value));
    showFriedToast(intl.copiedInvitationCode);
  });
}
