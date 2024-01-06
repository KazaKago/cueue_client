import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/global/utils/use_overlay_toast.dart';
import 'package:cueue/model/invitation/invitation_code.dart';
import 'package:flutter/services.dart';

SWRTriggerState<InvitationCode, void> useSetInvitationCodeToClipboard() {
  final intl = useIntl();
  final overlayToast = useOverlayToast();
  return useSWRTrigger<InvitationCode, void>((code) async {
    await Clipboard.setData(ClipboardData(text: code.value));
    overlayToast(intl.copiedInvitationCode);
  });
}
