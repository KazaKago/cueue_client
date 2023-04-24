import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_snack_bar.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_sign_out.dart';
import 'package:cueue/hooks/hierarchy/setting/use_go_store.dart';
import 'package:cueue/ui/global/extension/exception_extension.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog.dart';
import 'package:cueue/ui/hierarchy/auth/reauthentication_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

String Function(Exception) useGetErrorMessage(WidgetRef ref, {bool withSystemMessage = true}) {
  final intl = useIntl();
  final errorCheck = _useErrorCheck(ref);
  return (error) {
    errorCheck(error);
    final message = error.when(
      invalidParams: (error) => intl.invalidParams(error.message),
      invalidToken: (error) => intl.invalidToken,
      notFound: (error) => intl.notFound,
      conflict: (error) => intl.conflict,
      upgradeRequired: (error) => intl.upgradeRequired,
      serviceUnavailable: (error) => intl.serviceUnavailable,
      clientError: (error) => intl.clientError,
      serverError: (error) => intl.serverError,
      networkTimeout: (error) => intl.networkTimeout,
      networkCancel: (error) => intl.networkCancel,
      networkError: (error) => intl.networkError,
      authorizationFailed: (error) => intl.authorizationFailed,
      authorizationCanceled: (error) => intl.authorizationCanceled,
      reauthenticateRequired: (error) => intl.reauthenticateRequired,
      tooManyRequests: (error) => intl.tooManyRequests,
      userNotFound: (error) => intl.userNotFound,
      credentialAlreadyInUse: (error) => intl.credentialAlreadyInUse,
      accountExistsWithDifferentCredential: (error) => intl.accountExistsWithDifferentCredential(error.existsSignInMethods.join('\n - ')),
      userTokenExpired: (error) => intl.userTokenExpired,
      notFoundInvitation: (error) => intl.notFoundInvitationMessage,
      otherException: (error) => intl.otherException,
    );
    return withSystemMessage ? '$message\n\n$error' : message;
  };
}

SWRTriggerState<Exception, void> useShowErrorDialog(WidgetRef ref) {
  final context = useContext();
  final intl = useIntl();
  final getErrorMessage = useGetErrorMessage(ref);
  return useSWRTrigger((error) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleMessageDialog(
          title: intl.error,
          message: getErrorMessage(error),
          positiveButton: intl.ok,
        );
      },
    );
  });
}

SWRTriggerState<Exception, void> useShowErrorSnackbar(WidgetRef ref) {
  final showSnackbar = useShowSnackbar();
  final getErrorMessage = useGetErrorMessage(ref, withSystemMessage: false);
  return useSWRTrigger((error) async {
    showSnackbar(getErrorMessage(error));
  });
}

bool Function(Exception) _useErrorCheck(WidgetRef ref) {
  final intl = useIntl();
  final signOut = useSignOut(ref);
  final goStore = useGoStore();
  final showSimpleMessageDialogWithSignOut = useShowSimpleMessageDialog();
  final showSimpleMessageDialogWithGoStore = useShowSimpleMessageDialog();
  final reauthenticationDialog = useReauthenticationDialog();
  useEffectSWRData(showSimpleMessageDialogWithSignOut, (_) {
    signOut.trigger(null);
  });
  useEffectSWRData(showSimpleMessageDialogWithGoStore, (_) {
    goStore.trigger(null);
  });
  return (error) {
    return error.when(
      invalidParams: (error) => false,
      invalidToken: (error) {
        showSimpleMessageDialogWithSignOut.trigger(
          SimpleMessageDialogData(
            title: intl.error,
            message: intl.invalidToken,
            positiveButton: intl.ok,
          ),
        );
        return true;
      },
      upgradeRequired: (error) {
        showSimpleMessageDialogWithGoStore.trigger(
          SimpleMessageDialogData(
            title: intl.error,
            message: intl.upgradeRequired,
            positiveButton: intl.ok,
          ),
        );
        return true;
      },
      notFound: (error) => false,
      conflict: (error) => false,
      serviceUnavailable: (error) => false,
      clientError: (error) => false,
      serverError: (error) => false,
      networkTimeout: (error) => false,
      networkCancel: (error) => false,
      networkError: (error) => false,
      authorizationFailed: (error) => false,
      authorizationCanceled: (error) {
        // do nothing.
        return true;
      },
      reauthenticateRequired: (error) {
        reauthenticationDialog.trigger(error);
        return true;
      },
      tooManyRequests: (error) => false,
      userNotFound: (error) => false,
      credentialAlreadyInUse: (error) => false,
      accountExistsWithDifferentCredential: (error) => false,
      userTokenExpired: (error) {
        showSimpleMessageDialogWithSignOut.trigger(
          SimpleMessageDialogData(
            title: intl.error,
            message: intl.userTokenExpired,
            positiveButton: intl.ok,
          ),
        );
        return true;
      },
      notFoundInvitation: (error) => false,
      otherException: (error) => false,
    );
  };
}
