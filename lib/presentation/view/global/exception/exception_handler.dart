import 'package:cueue/domain/model/global/exception/require_reautentication_exception.dart';
import 'package:cueue/domain/usecase/di/usecase_provider.dart';
import 'package:cueue/presentation/view/global/extension/exception_extension.dart';
import 'package:cueue/presentation/view/global/modal/simple_message_dialog.dart';
import 'package:cueue/presentation/view/hierarchy/auth/reauthentication_dialog.dart';
import 'package:cueue/presentation/view/hierarchy/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class ExceptionHandler {
  const ExceptionHandler();

  String getMessage(final BuildContext context, final WidgetRef ref, final Exception exception, {final bool withSystemMessage = true}) {
    Future.delayed(Duration.zero, () => _preCheck(context, ref, exception));
    return _getMessage(context, ref, exception, withSystemMessage: withSystemMessage);
  }

  Future<void> showMessageDialog(final BuildContext context, final WidgetRef ref, final Exception exception) async {
    if (await _preCheck(context, ref, exception)) return;
    await _showMessageDialog(context, ref, exception);
  }

  String _getMessage(final BuildContext context, final WidgetRef ref, final Exception exception, {final bool withSystemMessage = true}) {
    final message = exception.when(
      invalidParams: (exception) => AppLocalizations.of(context)!.invalidParams(exception.message),
      invalidToken: (exception) => AppLocalizations.of(context)!.invalidToken,
      notFound: (exception) => AppLocalizations.of(context)!.notFound,
      conflict: (exception) => AppLocalizations.of(context)!.conflict,
      upgradeRequired: (exception) => AppLocalizations.of(context)!.upgradeRequired,
      serviceUnavailable: (exception) => AppLocalizations.of(context)!.serviceUnavailable,
      clientError: (exception) => AppLocalizations.of(context)!.clientError,
      serverError: (exception) => AppLocalizations.of(context)!.serverError,
      networkTimeout: (exception) => AppLocalizations.of(context)!.networkTimeout,
      networkCancel: (exception) => AppLocalizations.of(context)!.networkCancel,
      networkError: (exception) => AppLocalizations.of(context)!.networkError,
      authorizationFailed: (exception) => AppLocalizations.of(context)!.authorizationFailed,
      authorizationCanceled: (exception) => AppLocalizations.of(context)!.authorizationCanceled,
      invalidEmail: (exception) => AppLocalizations.of(context)!.invalidEmail,
      invalidPassword: (exception) => AppLocalizations.of(context)!.invalidPassword,
      doNotMatchPassword: (exception) => AppLocalizations.of(context)!.doNotMatchPassword,
      reauthenticateRequired: (exception) => AppLocalizations.of(context)!.reauthenticateRequired,
      wrongPassword: (exception) => AppLocalizations.of(context)!.wrongPassword,
      tooManyRequests: (exception) => AppLocalizations.of(context)!.tooManyRequests,
      userNotFound: (exception) => AppLocalizations.of(context)!.userNotFound,
      emailAlreadyInUse: (exception) => AppLocalizations.of(context)!.emailAlreadyInUse,
      credentialAlreadyInUse: (exception) => AppLocalizations.of(context)!.credentialAlreadyInUse,
      accountExistsWithDifferentCredential: (exception) => AppLocalizations.of(context)!.accountExistsWithDifferentCredential(exception.existsSignInMethods.join('\n - ')),
      userTokenExpired: (exception) => AppLocalizations.of(context)!.userTokenExpired,
      otherException: (exception) => AppLocalizations.of(context)!.otherException,
    );
    return withSystemMessage ? '$message\n\n${exception.toString()}' : message;
  }

  Future<void> _showMessageDialog(final BuildContext context, final WidgetRef ref, final Exception exception) async {
    final dialog = SimpleMessageDialog(context, title: AppLocalizations.of(context)!.error, message: _getMessage(context, ref, exception), positiveButton: AppLocalizations.of(context)!.close);
    await dialog.show();
  }

  Future<bool> _preCheck(final BuildContext context, final WidgetRef ref, final Exception exception) {
    return exception.when(
      invalidParams: (exception) async => false,
      invalidToken: (exception) async {
        await _showMessageDialog(context, ref, exception);
        await _signOut(context, ref);
        return true;
      },
      upgradeRequired: (exception) async {
        await _showMessageDialog(context, ref, exception);
        await _goStore(context, ref);
        return true;
      },
      notFound: (exception) async => false,
      conflict: (exception) async => false,
      serviceUnavailable: (exception) async => false,
      clientError: (exception) async => false,
      serverError: (exception) async => false,
      networkTimeout: (exception) async => false,
      networkCancel: (exception) async => false,
      networkError: (exception) async => false,
      authorizationFailed: (exception) async => false,
      authorizationCanceled: (exception) async {
        // do nothing.
        return true;
      },
      invalidEmail: (exception) async => false,
      invalidPassword: (exception) async => false,
      doNotMatchPassword: (exception) async => false,
      reauthenticateRequired: (exception) async {
        await _showReauthenticationDialog(context, ref, exception);
        return true;
      },
      wrongPassword: (exception) async => false,
      tooManyRequests: (exception) async => false,
      userNotFound: (exception) async => false,
      emailAlreadyInUse: (exception) async => false,
      credentialAlreadyInUse: (exception) async => false,
      accountExistsWithDifferentCredential: (exception) async => false,
      userTokenExpired: (exception) async {
        await _showMessageDialog(context, ref, exception);
        await _signOut(context, ref);
        return true;
      },
      otherException: (exception) async => false,
    );
  }

  Future<void> _showReauthenticationDialog(final BuildContext context, final WidgetRef ref, final RequireReauthenticationException exception) async {
    final dialog = ReauthenticationDialog(context, ref, exception);
    await dialog.show();
  }

  Future<void> _signOut(final BuildContext context, final WidgetRef ref) async {
    final signOutUseCase = ref.read(signOutUseCaseProvider);
    await signOutUseCase();
    await Navigator.pushAndRemoveUntil<void>(context, MaterialPageRoute(builder: (context) => const WelcomePage()), (_) => false);
  }

  Future<void> _goStore(final BuildContext context, final WidgetRef ref) async {
    final getStoreLinkUseCase = ref.read(getStoreLinkUseCaseProvider);
    final storeLink = await getStoreLinkUseCase();
    await launch(storeLink.toString());
  }
}
