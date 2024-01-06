import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/global/utils/use_theme.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_sign_out.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_update_display_name.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_update_user_image.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_update_workspace_name.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_user.dart';
import 'package:cueue/ui/global/widget/error_handling_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPage extends HookConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = useIntl();
    final userState = useUser(ref);
    final goNamed = useGoNamed();
    final signOut = useSignOutWithConfirmation(ref);
    final scrollController = useScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.mypage),
        actions: [
          IconButton(
            onPressed: () => goNamed.trigger(GoName('settings')),
            icon: const Icon(Icons.settings),
            tooltip: intl.settings,
          ),
          IconButton(
            onPressed: () => signOut.trigger(null),
            icon: const Icon(Icons.exit_to_app),
            tooltip: intl.logout,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => userState.mutate(null),
        child: Scrollbar(
          controller: scrollController,
          child: ListView(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              const SizedBox(height: 16),
              _buildProfileImage(ref),
              _buildNickNameTitle(ref),
              _buildNickname(ref),
              _buildWorkspaceTitle(ref),
              _buildWorkspace(ref),
              _buildWorkspaceMembersTitle(ref),
              for (final workspaceMember in _buildWorkspaceMembers(ref)) workspaceMember,
              const SizedBox(height: 16),
              _buildInviteWorkspace(ref),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(WidgetRef ref) {
    final intl = useIntl();
    final theme = useTheme();
    final userState = useUser(ref);
    final updateUserImage = useUpdateUserImage(ref, userState);
    final user = userState.data;
    final error = userState.error;
    if (user != null) {
      final photo = user.photo;
      if (photo != null) {
        return Center(
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              GestureDetector(
                onTap: () => updateUserImage.trigger(null),
                child: SizedBox(
                  width: 196,
                  height: 196,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: CachedNetworkImageProvider(photo.url.toString()),
                  ),
                ),
              ),
              FloatingActionButton.small(
                elevation: 1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                onPressed: () => updateUserImage.trigger(null),
                tooltip: intl.changePhoto,
                heroTag: intl.changePhoto,
                child: const Icon(Icons.edit),
              ),
            ],
          ),
        );
      } else {
        return Center(
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              GestureDetector(
                onTap: () => updateUserImage.trigger(null),
                child: SizedBox(
                  width: 196,
                  height: 196,
                  child: CircleAvatar(
                    backgroundColor: theme.dividerColor,
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Assets.images.icAppIcon.image(color: theme.hoverColor),
                    ),
                  ),
                ),
              ),
              FloatingActionButton.small(
                elevation: 1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                onPressed: () => updateUserImage.trigger(null),
                tooltip: intl.changePhoto,
                heroTag: intl.changePhoto,
                child: const Icon(Icons.edit),
              ),
            ],
          ),
        );
      }
    } else if (error != null) {
      return ErrorHandlingWidget(error);
    } else {
      return const SizedBox(
        width: 196,
        height: 196,
        child: Center(child: CircularProgressIndicator()),
      );
    }
  }

  Widget _buildNickNameTitle(WidgetRef ref) {
    final intl = useIntl();
    final theme = useTheme();
    return ListTile(
      subtitle: Text(intl.displayName, style: theme.textTheme.bodySmall),
    );
  }

  Widget _buildNickname(WidgetRef ref) {
    final intl = useIntl();
    final updateDisplayName = useUpdateDisplayName(ref);
    final userState = useUser(ref);
    final user = userState.data;
    final error = userState.error;
    if (user != null) {
      return ListTile(
        leading: const Icon(Icons.account_circle_outlined),
        trailing: const Icon(Icons.edit),
        title: Text(user.displayName),
        onTap: () => updateDisplayName.trigger(null),
      );
    } else if (error != null) {
      return ListTile(
        leading: const Icon(Icons.account_circle_outlined),
        title: Text(intl.errorLoading),
      );
    } else {
      return ListTile(
        leading: const Icon(Icons.account_circle_outlined),
        title: Text(intl.loading),
      );
    }
  }

  Widget _buildWorkspaceTitle(WidgetRef ref) {
    final intl = useIntl();
    final theme = useTheme();
    return ListTile(
      subtitle: Text(intl.currentWorkspace, style: theme.textTheme.bodySmall),
    );
  }

  Widget _buildWorkspace(WidgetRef ref) {
    final intl = useIntl();
    final updateWorkspaceName = useUpdateWorkspaceName(ref);
    final userState = useUser(ref);
    final user = userState.data;
    final error = userState.error;
    if (user != null) {
      return ListTile(
        leading: const Icon(Icons.workspaces),
        trailing: const Icon(Icons.edit),
        title: Text(user.requireWorkspace().name),
        onTap: () => updateWorkspaceName.trigger(null),
      );
    } else if (error != null) {
      return ListTile(
        leading: const Icon(Icons.workspaces),
        title: Text(intl.errorLoading),
      );
    } else {
      return ListTile(
        leading: const Icon(Icons.workspaces),
        title: Text(intl.loading),
      );
    }
  }

  Widget _buildWorkspaceMembersTitle(WidgetRef ref) {
    final intl = useIntl();
    final theme = useTheme();
    final userState = useUser(ref);
    final user = userState.data;
    final error = userState.error;
    if (user != null) {
      return ListTile(
        subtitle: Text(intl.memberOfWorkspaceWithCount(user.requireWorkspace().users.length), style: theme.textTheme.bodySmall),
      );
    } else if (error != null) {
      return ListTile(
        subtitle: Text(intl.memberOfWorkspace, style: theme.textTheme.bodySmall),
      );
    } else {
      return ListTile(
        subtitle: Text(intl.memberOfWorkspace, style: theme.textTheme.bodySmall),
      );
    }
  }

  List<Widget> _buildWorkspaceMembers(WidgetRef ref) {
    final intl = useIntl();
    final theme = useTheme();
    final userState = useUser(ref);
    final user = userState.data;
    final error = userState.error;
    if (user != null) {
      return user.requireWorkspace().users.map(
        (user) {
          if (user.photo != null) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: CachedNetworkImageProvider(user.photo!.url.toString()),
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
        },
      ).toList();
    } else if (error != null) {
      return [
        ListTile(
          leading: const Icon(Icons.account_circle_outlined),
          title: Text(intl.errorLoading),
        ),
      ];
    } else {
      return [
        ListTile(
          leading: const Icon(Icons.account_circle_outlined),
          title: Text(intl.loading),
        ),
      ];
    }
  }

  Widget _buildInviteWorkspace(WidgetRef ref) {
    final intl = useIntl();
    final goNamed = useGoNamed();
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: TextButton.icon(
          icon: const Icon(Icons.add),
          label: Text(intl.inviteCurrentWorkspace),
          onPressed: () => goNamed.trigger(GoName('invitation_creation')),
        ),
      ),
    );
  }
}
