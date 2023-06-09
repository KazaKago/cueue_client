import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_date_format.dart';
import 'package:cueue/model/invitation/invitation.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:share_plus/share_plus.dart';

SWRTriggerState<Invitation, bool> useShareInvitationCode() {
  final intl = useIntl();
  final toDateTimeString = useToDateTimeString();
  const lpBaseUrl = String.fromEnvironment('lpBaseUrl');
  return useSWRTrigger((invitation) async {
    final text = intl.invitationCodeSharingMessage(
      invitation.workspace.name,
      invitation.code.value,
      toDateTimeString(invitation.expiredAt),
      lpBaseUrl,
    );
    await Share.share(text);
    return true;
  });
}
