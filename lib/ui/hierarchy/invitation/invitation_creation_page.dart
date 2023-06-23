import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/global/utils/use_theme.dart';
import 'package:cueue/hooks/hierarchy/invitation/use_create_invitation.dart';
import 'package:cueue/hooks/hierarchy/invitation/use_set_invitation_code_to_clipboard.dart';
import 'package:cueue/hooks/hierarchy/invitation/use_share_invitation_code.dart';
import 'package:cueue/model/invitation/invitation.dart';
import 'package:cueue/ui/global/widget/default_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InvitationCreationPage extends HookConsumerWidget {
  const InvitationCreationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = useIntl();
    final createInvitationState = useCreateInvitation(ref);
    return Scaffold(
      appBar: AppBar(title: Text(intl.invitationCode)),
      body: DefaultStateWidget<Invitation>(
        state: createInvitationState,
        child: _buildContent,
      ),
    );
  }

  Widget _buildContent(Invitation invitation) {
    final theme = useTheme();
    final intl = useIntl();
    final shareInvitationCode = useShareInvitationCode();
    final setInvitationCodeToClipboard = useSetInvitationCodeToClipboard();
    final scrollController = useScrollController();
    return Scrollbar(
      controller: scrollController,
      child: ListView(
        controller: scrollController,
        padding: const EdgeInsets.all(32),
        children: [
          Text(textAlign: TextAlign.center, intl.invitationCodePublishedTitle),
          const SizedBox(height: 16),
          ListTile(title: SelectableText(invitation.code.value, textAlign: TextAlign.center, style: theme.textTheme.displayLarge)),
          Center(
            child: TextButton.icon(
              icon: const Icon(Icons.copy),
              onPressed: () => setInvitationCodeToClipboard.trigger(invitation.code),
              label: Text(intl.copyInvitationCode),
            ),
          ),
          const SizedBox(height: 32),
          Text(textAlign: TextAlign.center, intl.invitationCodePublishedMessage),
          const SizedBox(height: 32),
          OutlinedButton.icon(
            icon: const Icon(Icons.share),
            onPressed: () => shareInvitationCode.trigger(invitation),
            label: Text(intl.shareInvitationCode),
          ),
        ],
      ),
    );
  }
}
