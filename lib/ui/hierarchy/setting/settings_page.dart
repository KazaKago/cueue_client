import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/global/utils/use_theme.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_user.dart';
import 'package:cueue/hooks/hierarchy/setting/use_go_privacy_policy.dart';
import 'package:cueue/hooks/hierarchy/setting/use_go_terms_of_service.dart';
import 'package:cueue/hooks/hierarchy/setting/use_toggle_with_apple.dart';
import 'package:cueue/hooks/hierarchy/setting/use_toggle_with_google.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = useIntl();
    final userState = useUser(ref);
    final scrollController = useScrollController();
    return Scaffold(
      appBar: AppBar(title: Text(intl.settings)),
      body: RefreshIndicator(
        onRefresh: () => userState.mutate(null),
        child: Scrollbar(
          controller: scrollController,
          child: ListView(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              _buildWorkspaceTitle(ref),
              _buildJoinOtherWorkspace(ref),
              _buildAccountTitle(ref),
              _buildGoogleConnectionTile(ref),
              _buildAppleConnectionTile(ref),
              _buildInfoTitle(ref),
              _buildAboutAppTile(ref),
              _buildTermsOfServicesTile(ref),
              _buildPrivacyPolicyTile(ref),
              _buildCautionOperationTitle(ref),
              _buildAccountDeletionTile(ref),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWorkspaceTitle(WidgetRef ref) {
    final intl = useIntl();
    final theme = useTheme();
    return ListTile(
      title: Text(intl.workspace, style: theme.textTheme.bodySmall),
    );
  }

  Widget _buildJoinOtherWorkspace(WidgetRef ref) {
    final intl = useIntl();
    final pushInvitationInput = usePushInvitationInputPage();
    return ListTile(
      leading: const Icon(Icons.workspaces),
      title: Text(intl.inputInvitationCode),
      subtitle: Text(intl.joinOtherWorkspace),
      onTap: () => pushInvitationInput.trigger(null),
    );
  }

  Widget _buildAccountTitle(WidgetRef ref) {
    final intl = useIntl();
    final theme = useTheme();
    return ListTile(
      title: Text(intl.account, style: theme.textTheme.bodySmall),
    );
  }

  Widget _buildGoogleConnectionTile(WidgetRef ref) {
    final intl = useIntl();
    final userState = useUser(ref);
    final user = userState.data;
    final error = userState.error;
    final toggleWithGoogle = useToggleWithGoogle(ref);
    if (user != null) {
      return ListTile(
        leading: const Icon(FontAwesomeIcons.google),
        title: Text(intl.google),
        trailing: Text((user.isGoogleLinked()) ? intl.alreadyConnect : intl.notYetConnect),
        subtitle: Text((user.isGoogleLinked()) ? intl.tapToUnConnectWith(user.googleProvider?.email ?? '') : intl.tapToConnect),
        onTap: () => toggleWithGoogle.trigger(null),
      );
    } else if (error != null) {
      return ListTile(
        leading: const Icon(FontAwesomeIcons.google),
        title: Text(intl.google),
        subtitle: Text(intl.errorLoading),
      );
    } else {
      return ListTile(
        leading: const Icon(FontAwesomeIcons.google),
        title: Text(intl.google),
        subtitle: Text(intl.loading),
      );
    }
  }

  Widget _buildAppleConnectionTile(WidgetRef ref) {
    final intl = useIntl();
    final userState = useUser(ref);
    final user = userState.data;
    final error = userState.error;
    final toggleWithApple = useToggleWithApple(ref);
    if (user != null) {
      return ListTile(
        leading: const Icon(FontAwesomeIcons.apple),
        title: Text(intl.apple),
        trailing: Text((user.isAppleLinked()) ? intl.alreadyConnect : intl.notYetConnect),
        subtitle: Text((user.isAppleLinked()) ? intl.tapToUnConnectWith(user.appleProvider?.email ?? '') : intl.tapToConnect),
        onTap: () => toggleWithApple.trigger(null),
      );
    } else if (error != null) {
      return ListTile(
        leading: const Icon(FontAwesomeIcons.apple),
        title: Text(intl.apple),
        subtitle: Text(intl.errorLoading),
      );
    } else {
      return ListTile(
        leading: const Icon(FontAwesomeIcons.apple),
        title: Text(intl.apple),
        subtitle: Text(intl.loading),
      );
    }
  }

  Widget _buildInfoTitle(WidgetRef ref) {
    final intl = useIntl();
    final theme = useTheme();
    return ListTile(
      title: Text(intl.info, style: theme.textTheme.bodySmall),
    );
  }

  Widget _buildAboutAppTile(WidgetRef ref) {
    final intl = useIntl();
    final pushAbout = usePushAboutPage();
    return ListTile(
      title: Text(intl.aboutApp),
      leading: const Icon(Icons.info_outline),
      onTap: () => pushAbout.trigger(null),
    );
  }

  Widget _buildTermsOfServicesTile(WidgetRef ref) {
    final intl = useIntl();
    final goTermOfService = useGoTermsOfService();
    return ListTile(
      title: Text(intl.termsOfService),
      leading: const Icon(Icons.library_books),
      onTap: () => goTermOfService.trigger(null),
    );
  }

  Widget _buildPrivacyPolicyTile(WidgetRef ref) {
    final intl = useIntl();
    final goPrivacyPolicy = useGoPrivacyPolicy();
    return ListTile(
      title: Text(intl.privacyPolicy),
      leading: const Icon(Icons.library_books),
      onTap: () => goPrivacyPolicy.trigger(null),
    );
  }

  Widget _buildCautionOperationTitle(WidgetRef ref) {
    final intl = useIntl();
    final theme = useTheme();
    return ListTile(
      title: Text(intl.other, style: theme.textTheme.bodySmall),
    );
  }

  Widget _buildAccountDeletionTile(WidgetRef ref) {
    final intl = useIntl();
    final theme = useTheme();
    final pushAccountDeletion = usePushAccountDeletionPage();
    return ListTile(
      title: Text(intl.accountDeletion),
      textColor: theme.colorScheme.error,
      leading: const Icon(Icons.delete_forever),
      iconColor: theme.colorScheme.error,
      onTap: () => pushAccountDeletion.trigger(null),
    );
  }
}
