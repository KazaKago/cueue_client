import 'package:cueue/domain/model/global/exception/require_reautentication_exception.dart';
import 'package:cueue/domain/usecase/di/usecase_provider.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/extension/exception_extension.dart';
import 'package:cueue/presentation/view/global/modal/simple_message_dialog.dart';
import 'package:cueue/presentation/view/hierarchy/auth/reauthentication_dialog.dart';
import 'package:cueue/presentation/view/hierarchy/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class ExceptionHandler {
  const ExceptionHandler();

  String getMessage(BuildContext context, WidgetRef ref, Exception exception, {bool withSystemMessage = true}) {
    Future.delayed(Duration.zero, () => _preCheck(context, ref, exception));
    return _getMessage(context, ref, exception, withSystemMessage: withSystemMessage);
  }

  Future<void> showMessageDialog(BuildContext context, WidgetRef ref, Exception exception) async {
    if (await _preCheck(context, ref, exception)) return;
    await _showMessageDialog(context, ref, exception);
  }

  Future<void> showSnackBar(BuildContext context, WidgetRef ref, Exception exception) async {
    if (await _preCheck(context, ref, exception)) return;
    _showSnackBar(context, ref, exception);
  }

  String _getMessage(BuildContext context, WidgetRef ref, Exception exception, {bool withSystemMessage = true}) {
    final message = exception.when(
      invalidParams: (exception) => intl(context).invalidParams(exception.message),
      invalidToken: (exception) => intl(context).invalidToken,
      notFound: (exception) => intl(context).notFound,
      conflict: (exception) => intl(context).conflict,
      upgradeRequired: (exception) => intl(context).upgradeRequired,
      serviceUnavailable: (exception) => intl(context).serviceUnavailable,
      clientError: (exception) => intl(context).clientError,
      serverError: (exception) => intl(context).serverError,
      networkTimeout: (exception) => intl(context).networkTimeout,
      networkCancel: (exception) => intl(context).networkCancel,
      networkError: (exception) => intl(context).networkError,
      authorizationFailed: (exception) => intl(context).authorizationFailed,
      authorizationCanceled: (exception) => intl(context).authorizationCanceled,
      invalidEmail: (exception) => intl(context).invalidEmail,
      invalidPassword: (exception) => intl(context).invalidPassword,
      doNotMatchPassword: (exception) => intl(context).doNotMatchPassword,
      reauthenticateRequired: (exception) => intl(context).reauthenticateRequired,
      wrongPassword: (exception) => intl(context).wrongPassword,
      tooManyRequests: (exception) => intl(context).tooManyRequests,
      userNotFound: (exception) => intl(context).userNotFound,
      emailAlreadyInUse: (exception) => intl(context).emailAlreadyInUse,
      credentialAlreadyInUse: (exception) => intl(context).credentialAlreadyInUse,
      accountExistsWithDifferentCredential: (exception) => intl(context).accountExistsWithDifferentCredential(exception.existsSignInMethods.join('\n - ')),
      userTokenExpired: (exception) => intl(context).userTokenExpired,
      otherException: (exception) => intl(context).otherException,
    );
    return withSystemMessage ? '$message\n\n${exception.toString()}' : message;
  }

  Future<void> _showMessageDialog(BuildContext context, WidgetRef ref, Exception exception) async {
    final dialog = SimpleMessageDialog(context, title: intl(context).error, message: _getMessage(context, ref, exception), positiveButton: intl(context).close);
    await dialog.show();
  }

  void _showSnackBar(BuildContext context, WidgetRef ref, Exception exception) {
    final snackBar = SnackBar(content: Text(_getMessage(context, ref, exception, withSystemMessage: false)));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<bool> _preCheck(BuildContext context, WidgetRef ref, Exception exception) {
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

  Future<void> _showReauthenticationDialog(BuildContext context, WidgetRef ref, RequireReauthenticationException exception) async {
    final dialog = ReauthenticationDialog(context, ref, exception);
    await dialog.show();
  }

  Future<void> _signOut(BuildContext context, WidgetRef ref) async {
    final signOutUseCase = ref.read(signOutUseCaseProvider);
    await signOutUseCase();
    await Navigator.pushAndRemoveUntil<void>(context, MaterialPageRoute(builder: (context) => const WelcomePage()), (_) => false);
  }

  Future<void> _goStore(BuildContext context, WidgetRef ref) async {
    final getStoreLinkUseCase = ref.read(getStoreLinkUseCaseProvider);
    final storeLink = await getStoreLinkUseCase();
    await launchUrl(storeLink);
  }
}
