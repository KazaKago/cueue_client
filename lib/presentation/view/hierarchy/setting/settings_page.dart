import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/global/modal/fried_toast.dart';
import 'package:cueue/presentation/view/global/modal/simple_message_dialog.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authorizer/apple_authorizer.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authorizer/google_authorizer.dart';
import 'package:cueue/presentation/view/hierarchy/setting/about_page.dart';
import 'package:cueue/presentation/view/hierarchy/setting/account_deletion_page.dart';
import 'package:cueue/presentation/view/hierarchy/setting/privacy_policy_url.dart';
import 'package:cueue/presentation/view/hierarchy/setting/settings_result_extension.dart';
import 'package:cueue/presentation/view/hierarchy/setting/terms_of_service_url.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/setting/settings_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(settingsViewModelProvider);
    ref
      ..listen<Event<Exception>>(settingsViewModelProvider.select((viewModel) => viewModel.exceptionEvent), (previous, exceptionEvent) {
        exceptionEvent((exception) => _showErrorDialog(context, ref, exception));
      })
      ..listen<Event<SettingResult>>(settingsViewModelProvider.select((viewModel) => viewModel.completionEvent), (previous, resultEvent) {
        resultEvent((result) => FriedToast(context, result.toFormattedString(context)).show());
      })
      ..listen<bool>(settingsViewModelProvider.select((viewModel) => viewModel.isLoading), (previous, isLoading) {
        isLoading ? EasyLoading.show() : EasyLoading.dismiss();
      });
    return Scaffold(
      appBar: AppBar(title: Text(intl(context).settings)),
      body: RefreshIndicator(
        onRefresh: viewModel.refresh,
        child: Scrollbar(
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              _buildAccountTitle(context, ref),
              _buildGoogleConnectionTile(context, ref),
              _buildAppleConnectionTile(context, ref),
              _buildInfoTitle(context, ref),
              _buildAboutAppTile(context, ref),
              _buildTermsOfServicesTile(context, ref),
              _buildPrivacyPolicyTile(context, ref),
              _buildCautionOperationTitle(context, ref),
              _buildAccountDeletionTile(context, ref),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountTitle(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(intl(context).account, style: Theme.of(context).textTheme.caption),
    );
  }

  Widget _buildGoogleConnectionTile(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsViewModelProvider.select((viewModel) => viewModel.state));
    return state.when(
      loading: () => ListTile(
        leading: const Icon(FontAwesomeIcons.google),
        title: Text(intl(context).google),
        subtitle: Text(intl(context).loading),
      ),
      completed: (user) => ListTile(
        leading: const Icon(FontAwesomeIcons.google),
        title: Text(intl(context).google),
        trailing: Text((user.isGoogleLinked()) ? intl(context).alreadyConnect : intl(context).notYetConnect),
        subtitle: Text((user.isGoogleLinked()) ? intl(context).tapToUnConnectWith(user.googleProvider!.displayName) : intl(context).tapToConnect),
        onTap: () {
          if (user.isGoogleLinked()) {
            _showUnlinkWithGoogleConfirmationDialog(context, ref);
          } else {
            _linkWithGoogle(context, ref);
          }
        },
      ),
      error: (exception) => ListTile(
        leading: const Icon(FontAwesomeIcons.google),
        title: Text(intl(context).google),
        subtitle: Text(intl(context).errorLoading),
      ),
    );
  }

  Widget _buildAppleConnectionTile(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsViewModelProvider.select((viewModel) => viewModel.state));
    return state.when(
      loading: () => ListTile(
        leading: const Icon(FontAwesomeIcons.apple),
        title: Text(intl(context).apple),
        subtitle: Text(intl(context).loading),
      ),
      completed: (user) => ListTile(
        leading: const Icon(FontAwesomeIcons.apple),
        title: Text(intl(context).apple),
        trailing: Text((user.isAppleLinked()) ? intl(context).alreadyConnect : intl(context).notYetConnect),
        subtitle: Text((user.isAppleLinked()) ? intl(context).tapToUnConnectWith(user.appleProvider!.displayName) : intl(context).tapToConnect),
        onTap: () {
          if (user.isAppleLinked()) {
            _showUnlinkWithAppleConfirmationDialog(context, ref);
          } else {
            _linkWithApple(context, ref);
          }
        },
      ),
      error: (exception) => ListTile(
        leading: const Icon(FontAwesomeIcons.apple),
        title: Text(intl(context).apple),
        subtitle: Text(intl(context).errorLoading),
      ),
    );
  }

  Widget _buildInfoTitle(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(intl(context).info, style: Theme.of(context).textTheme.caption),
    );
  }

  Widget _buildAboutAppTile(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(intl(context).aboutApp),
      leading: const Icon(Icons.info_outline),
      onTap: () => _showAbout(context),
    );
  }

  Widget _buildTermsOfServicesTile(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(intl(context).termsOfService),
      leading: const Icon(Icons.library_books),
      onTap: _goTermsOfService,
    );
  }

  Widget _buildPrivacyPolicyTile(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(intl(context).privacyPolicy),
      leading: const Icon(Icons.library_books),
      onTap: _goPrivacyPolicy,
    );
  }

  Widget _buildCautionOperationTitle(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(intl(context).other, style: Theme.of(context).textTheme.caption),
    );
  }

  Widget _buildAccountDeletionTile(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(intl(context).accountDeletion),
      textColor: Theme.of(context).errorColor,
      leading: const Icon(Icons.delete_forever),
      iconColor: Theme.of(context).errorColor,
      onTap: () => _goAccountDeletion(context),
    );
  }

  Future<void> _linkWithGoogle(BuildContext context, WidgetRef ref) async {
    final viewModel = ref.read(settingsViewModelProvider);
    try {
      final authInfo = await const GoogleAuthorizer().authorize(context);
      await viewModel.linkWithGoogle(authInfo);
    } on Exception catch (exception) {
      await const ExceptionHandler().showMessageDialog(context, ref, exception);
    }
  }

  Future<void> _linkWithApple(BuildContext context, WidgetRef ref) async {
    final viewModel = ref.read(settingsViewModelProvider);
    try {
      final authInfo = await const AppleAuthorizer().authorize(context);
      await viewModel.linkWithApple(authInfo);
    } on Exception catch (exception) {
      await const ExceptionHandler().showMessageDialog(context, ref, exception);
    }
  }

  Future<void> _showUnlinkWithGoogleConfirmationDialog(BuildContext context, WidgetRef ref) async {
    final event = await SimpleMessageDialog(context, title: intl(context).confirm, message: intl(context).confirmToUnConnectGoogle, positiveButton: intl(context).unConnect, negativeButton: intl(context).cancel).show();
    if (event != null) {
      await event.when(
        positive: () async {
          final viewModel = ref.read(settingsViewModelProvider);
          await viewModel.unlinkWithGoogle();
        },
        neutral: () {},
        negative: () {},
      );
    }
  }

  Future<void> _showUnlinkWithAppleConfirmationDialog(BuildContext context, WidgetRef ref) async {
    final event = await SimpleMessageDialog(context, title: intl(context).confirm, message: intl(context).confirmToUnConnectApple, positiveButton: intl(context).unConnect, negativeButton: intl(context).cancel).show();
    if (event != null) {
      await event.when(
        positive: () async {
          final viewModel = ref.read(settingsViewModelProvider);
          await viewModel.unlinkWithApple();
        },
        neutral: () {},
        negative: () {},
      );
    }
  }

  Future<void> _showErrorDialog(BuildContext context, WidgetRef ref, Exception exception) async {
    await const ExceptionHandler().showMessageDialog(context, ref, exception);
  }

  Future<void> _showAbout(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
  }

  Future<void> _goTermsOfService() async {
    await launchUrl(termsOfServiceUrl);
  }

  Future<void> _goPrivacyPolicy() async {
    await launchUrl(privacyPolicyUrl);
  }

  Future<void> _goAccountDeletion(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountDeletionPage()));
  }
}
