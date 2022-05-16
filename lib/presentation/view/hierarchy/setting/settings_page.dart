import 'package:cueue/domain/model/global/exception/do_not_match_password_exception.dart';
import 'package:cueue/domain/model/global/exception/email_validation_exception.dart';
import 'package:cueue/domain/model/global/exception/password_validation_exception.dart';
import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/global/modal/fried_toast.dart';
import 'package:cueue/presentation/view/global/modal/multi_text_field_dialog.dart';
import 'package:cueue/presentation/view/global/modal/simple_message_dialog.dart';
import 'package:cueue/presentation/view/global/modal/text_field_dialog.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authorizer/apple_authorizer.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authorizer/google_authorizer.dart';
import 'package:cueue/presentation/view/hierarchy/setting/about_page.dart';
import 'package:cueue/presentation/view/hierarchy/setting/account_deletion_page.dart';
import 'package:cueue/presentation/view/hierarchy/setting/privacy_policy_url.dart';
import 'package:cueue/presentation/view/hierarchy/setting/settings_result_extension.dart';
import 'package:cueue/presentation/view/hierarchy/setting/terms_of_service_url.dart';
import 'package:cueue/presentation/view/hierarchy/welcome/welcome_page.dart';
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
      ..listen<Event<void>>(settingsViewModelProvider.select((viewModel) => viewModel.replaceWelcomePageEvent), (previous, replaceWelcomePageEvent) {
        replaceWelcomePageEvent((_) => _replaceWelcomePage(context));
      })
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
              _buildAccountSettingsTitle(context, ref),
              _buildEmailNotVerifiedTile(context, ref),
              _buildEmailChangingTile(context, ref),
              _buildSignOutTile(context, ref),
              _buildAccountConnectionTitle(context, ref),
              _buildEmailConnectionTile(context, ref),
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

  Widget _buildAccountSettingsTitle(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(intl(context).accountSettings, style: Theme.of(context).textTheme.caption),
    );
  }

  Widget _buildEmailNotVerifiedTile(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsViewModelProvider.select((viewModel) => viewModel.state));
    return state.when(
      loading: () => const SizedBox(),
      completed: (user) {
        if (!user.isEmailVerified) {
          return ListTile(
            leading: const Icon(Icons.warning),
            iconColor: Theme.of(context).errorColor,
            title: Text(intl(context).unConfirmationMail),
            subtitle: Text(intl(context).tapToConfirmMail),
            textColor: Theme.of(context).errorColor,
            trailing: PopupMenuButton<int>(
              onSelected: (int index) {
                switch (index) {
                  case 1:
                    final viewModel = ref.read(settingsViewModelProvider);
                    viewModel.refresh();
                    break;
                  case 2:
                    _showSendingEmailVerificationConfirmationDialog(context, ref, user.email);
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 1,
                    child: Text(intl(context).refreshInfo),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text(intl(context).sendConfirmationMail),
                  ),
                ];
              },
            ),
            onTap: () {
              _showSendingEmailVerificationConfirmationDialog(context, ref, user.email);
            },
          );
        } else {
          return const SizedBox();
        }
      },
      error: (exception) => const SizedBox(),
    );
  }

  Widget _buildEmailChangingTile(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsViewModelProvider.select((viewModel) => viewModel.state));
    return state.when(
      loading: () => ListTile(
        leading: const Icon(Icons.mail_outline),
        title: Text(intl(context).changeMailAddress),
        subtitle: Text(intl(context).loading),
      ),
      completed: (user) => ListTile(
        leading: const Icon(Icons.mail_outline),
        title: Text(intl(context).changeMailAddress),
        subtitle: Text(user.email.value),
        onTap: () async {
          await _showEmailInputDialog(context, ref);
        },
      ),
      error: (exception) => ListTile(
        leading: const Icon(Icons.mail_outline),
        title: Text(intl(context).changeMailAddress),
        subtitle: Text(intl(context).errorLoading),
      ),
    );
  }

  Widget _buildSignOutTile(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(intl(context).logout),
      leading: const Icon(Icons.exit_to_app),
      onTap: () => _showSignOutConfirmationDialog(context, ref),
    );
  }

  Widget _buildAccountConnectionTitle(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(intl(context).accountConnection, style: Theme.of(context).textTheme.caption),
    );
  }

  Widget _buildEmailConnectionTile(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsViewModelProvider.select((viewModel) => viewModel.state));
    return state.when(
      loading: () => ListTile(
        leading: const Icon(FontAwesomeIcons.key),
        title: Text(intl(context).password),
        subtitle: Text(intl(context).loading),
      ),
      completed: (user) => ListTile(
        leading: const Icon(FontAwesomeIcons.key),
        title: Text(intl(context).password),
        subtitle: Text((user.isPasswordLinked()) ? intl(context).tapToChangePassword : intl(context).tapToSetPassword),
        trailing: Text((user.isPasswordLinked()) ? intl(context).alreadySetting : intl(context).notYetSetting),
        onTap: () => _showPasswordInputDialog(context, ref),
      ),
      error: (exception) => ListTile(
        leading: const Icon(FontAwesomeIcons.key),
        title: Text(intl(context).password),
        subtitle: Text(intl(context).errorLoading),
      ),
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
      title: Text(intl(context).cautionOperation, style: Theme.of(context).textTheme.caption),
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

  Future<void> _showEmailInputDialog(BuildContext context, WidgetRef ref, {String? defaultText}) async {
    final event = await TextFieldDialog(context, title: intl(context).changeMailAddress, labelText: intl(context).wantToChangeMailAddress, defaultText: defaultText, keyboardType: TextInputType.emailAddress, positiveButton: intl(context).doChange, negativeButton: intl(context).cancel).show();
    if (event != null) {
      await event.when(
        positive: (currentText, originalText) async {
          final viewModel = ref.read(settingsViewModelProvider);
          await viewModel.updateEmail(event.currentText);
        },
        negative: (currentText, originalText) {},
        neutral: (currentText, originalText) {},
      );
    }
  }

  Future<void> _showPasswordInputDialog(BuildContext context, WidgetRef ref, {String? defaultText}) async {
    final event = await MultiTextFieldDialog(context, [TextFieldContent(labelText: intl(context).wantToChangePassword, defaultText: defaultText, keyboardType: TextInputType.visiblePassword), TextFieldContent(labelText: intl(context).reInputPassword, keyboardType: TextInputType.visiblePassword)], title: intl(context).setPassword, positiveButton: intl(context).doSet, negativeButton: intl(context).cancel).show();
    if (event != null) {
      await event.when(
        positive: (results) async {
          final viewModel = ref.read(settingsViewModelProvider);
          await viewModel.updatePassword(results[1].currentText, results[0].currentText);
        },
        negative: (List<MultiTextFieldDialogResult> results) {},
        neutral: (List<MultiTextFieldDialogResult> results) {},
      );
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

  Future<void> _showSignOutConfirmationDialog(BuildContext context, WidgetRef ref) async {
    final event = await SimpleMessageDialog(context, title: intl(context).confirm, message: intl(context).confirmLogout, positiveButton: intl(context).logout, negativeButton: intl(context).cancel).show();
    if (event != null) {
      await event.when(
        positive: () async {
          final viewModel = ref.read(settingsViewModelProvider);
          await viewModel.signOut();
        },
        negative: () {},
        neutral: () {},
      );
    }
  }

  Future<void> _showSendingEmailVerificationConfirmationDialog(BuildContext context, WidgetRef ref, Email email) async {
    final event = await SimpleMessageDialog(context, title: intl(context).confirm, message: intl(context).confirmSendingMailTo(email.value), positiveButton: intl(context).doSend, negativeButton: intl(context).cancel).show();
    if (event != null) {
      await event.when(
        positive: () async {
          final viewModel = ref.read(settingsViewModelProvider);
          await viewModel.sendEmailVerification(email);
        },
        negative: () {},
        neutral: () {},
      );
    }
  }

  Future<void> _showErrorDialog(BuildContext context, WidgetRef ref, Exception exception) async {
    await const ExceptionHandler().showMessageDialog(context, ref, exception);
    if (exception is EmailValidationException) {
      await _showEmailInputDialog(context, ref, defaultText: exception.value);
    } else if (exception is PasswordValidationException) {
      await _showPasswordInputDialog(context, ref, defaultText: exception.value);
    } else if (exception is DoNotMatchPasswordException) {
      await _showPasswordInputDialog(context, ref, defaultText: exception.value);
    }
  }

  Future<void> _replaceWelcomePage(BuildContext context) {
    return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const WelcomePage()), (_) => false);
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
