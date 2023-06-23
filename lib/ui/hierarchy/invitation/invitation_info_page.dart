import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/global/utils/use_theme.dart';
import 'package:cueue/hooks/hierarchy/invitation/use_accept_invitation.dart';
import 'package:cueue/hooks/hierarchy/invitation/use_get_invitation_info.dart';
import 'package:cueue/model/invitation/invitation.dart';
import 'package:cueue/model/invitation/invitation_code.dart';
import 'package:cueue/model/user/user_summary.dart';
import 'package:cueue/ui/global/widget/default_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InvitationInfoPage extends HookConsumerWidget {
  const InvitationInfoPage(this.code, {super.key});

  final InvitationCode code;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = useIntl();
    final getInvitationState = useGetInvitationInfo(ref, code);
    return Scaffold(
      appBar: AppBar(title: Text(intl.workspaceInfo)),
      body: DefaultStateWidget<Invitation>(
        state: getInvitationState,
        child: (invitation) => _buildContent(ref, invitation),
      ),
    );
  }

  Widget _buildContent(WidgetRef ref, Invitation invitation) {
    final theme = useTheme();
    final intl = useIntl();
    final scrollController = useScrollController();
    final acceptInvitation = useAcceptInvitation(ref);
    return Scrollbar(
      controller: scrollController,
      child: ListView(
        controller: scrollController,
        padding: const EdgeInsets.all(32),
        children: [
          Text(textAlign: TextAlign.center, intl.confirmJoinFollowingWorkspace),
          ListTile(subtitle: Text(intl.workspaceName, style: theme.textTheme.bodySmall)),
          ListTile(title: Text(invitation.workspace.name)),
          ListTile(subtitle: Text(intl.memberOfWorkspace, style: theme.textTheme.bodySmall)),
          for (final user in invitation.workspace.users) buildWorkspaceMember(user),
          const SizedBox(height: 32),
          Text(textAlign: TextAlign.center, intl.warningJoiningWorkspace),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => acceptInvitation.trigger(code),
            child: Text(intl.joinWorkspace),
          ),
        ],
      ),
    );
  }

  Widget buildWorkspaceMember(UserSummary user) {
    final theme = useTheme();
    final photo = user.photo;
    if (photo != null) {
      return ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: CachedNetworkImageProvider(photo.url.toString()),
        ),
        title: Text(user.displayName),
      );
    } else {
      return ListTile(
        leading: CircleAvatar(
          backgroundColor: theme.dividerColor,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Assets.images.icAppIcon.image(color: theme.hoverColor),
          ),
        ),
        title: Text(user.displayName),
      );
    }
  }
}
