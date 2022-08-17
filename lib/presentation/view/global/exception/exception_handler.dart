import 'package:cueue/domain/model/global/exception/require_reautentication_exception.dart';
import 'package:cueue/domain/usecase/di/usecase_provider.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/extension/exception_extension.dart';
import 'package:cueue/presentation/view/global/modal/simple_message_dialog.dart';
import 'package:cueue/presentation/view/global/modal/simple_message_dialog_event.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authentication_page.dart';
import 'package:cueue/presentation/view/hierarchy/auth/reauthentication_dialog.dart';
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
      reauthenticateRequired: (exception) => intl(context).reauthenticateRequired,
      tooManyRequests: (exception) => intl(context).tooManyRequests,
      userNotFound: (exception) => intl(context).userNotFound,
      credentialAlreadyInUse: (exception) => intl(context).credentialAlreadyInUse,
      accountExistsWithDifferentCredential: (exception) => intl(context).accountExistsWithDifferentCredential(exception.existsSignInMethods.join('\n - ')),
      userTokenExpired: (exception) => intl(context).userTokenExpired,
      notFoundInvitation: (exception) => intl(context).notFoundInvitationMessage,
      otherException: (exception) => intl(context).otherException,
    );
    return withSystemMessage ? '$message\n\n${exception.toString()}' : message;
  }

  Future<void> _showMessageDialog(BuildContext context, WidgetRef ref, Exception exception) async {
    await showDialog<SimpleMessageDialogEvent>(
      context: context,
      builder: (context) => SimpleMessageDialog(title: intl(context).error, message: _getMessage(context, ref, exception), positiveButton: intl(context).ok),
    );
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
      reauthenticateRequired: (exception) async {
        await _showReauthenticationDialog(context, ref, exception);
        return true;
      },
      tooManyRequests: (exception) async => false,
      userNotFound: (exception) async => false,
      credentialAlreadyInUse: (exception) async => false,
      accountExistsWithDifferentCredential: (exception) async => false,
      userTokenExpired: (exception) async {
        await _showMessageDialog(context, ref, exception);
        await _signOut(context, ref);
        return true;
      },
      notFoundInvitation: (exception) async => false,
      otherException: (exception) async => false,
    );
  }

  Future<void> _showReauthenticationDialog(BuildContext context, WidgetRef ref, RequireReauthenticationException exception) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) => ReauthenticationDialog(exception),
    );
  }

  Future<void> _signOut(BuildContext context, WidgetRef ref) async {
    final signOutUseCase = ref.read(signOutUseCaseProvider);
    await signOutUseCase();
    await Navigator.pushAndRemoveUntil<void>(context, MaterialPageRoute(builder: (context) => const AuthenticationPage()), (_) => false);
  }

  Future<void> _goStore(BuildContext context, WidgetRef ref) async {
    final getAppInfoUseCase = ref.read(getAppInfoUseCaseProvider);
    final appInfo = await getAppInfoUseCase();
    await launchUrl(appInfo.storeLink);
  }
}
