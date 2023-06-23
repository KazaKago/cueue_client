import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/global/utils/use_snack_bar.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_sign_out.dart';
import 'package:cueue/hooks/hierarchy/setting/use_go_store.dart';
import 'package:cueue/model/exception/account_exists_with_different_credential_exception.dart';
import 'package:cueue/model/exception/autorization_cancel_exception.dart';
import 'package:cueue/model/exception/autorization_failed_exception.dart';
import 'package:cueue/model/exception/client_error_exception.dart';
import 'package:cueue/model/exception/conflict_exception.dart';
import 'package:cueue/model/exception/credential_already_in_use_exception.dart';
import 'package:cueue/model/exception/invalid_params_exception.dart';
import 'package:cueue/model/exception/invalid_token_exception.dart';
import 'package:cueue/model/exception/network_cancel_exception.dart';
import 'package:cueue/model/exception/network_exception.dart';
import 'package:cueue/model/exception/network_timeout_exception.dart';
import 'package:cueue/model/exception/not_found_exception.dart';
import 'package:cueue/model/exception/not_found_invitation_exception.dart';
import 'package:cueue/model/exception/require_reautentication_exception.dart';
import 'package:cueue/model/exception/server_error_exception.dart';
import 'package:cueue/model/exception/service_unavailable_exception.dart';
import 'package:cueue/model/exception/too_many_requests_exception.dart';
import 'package:cueue/model/exception/upgrade_required_exception.dart';
import 'package:cueue/model/exception/user_not_found_exception.dart';
import 'package:cueue/model/exception/user_token_expired_exception.dart';
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
    final message = error._when(
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
    return error._when(
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

extension ExceptionExtension on Exception {
  R _when<R>({
    required R Function(InvalidParamsException exception) invalidParams,
    required R Function(InvalidTokenException exception) invalidToken,
    required R Function(NotFoundException exception) notFound,
    required R Function(ConflictException exception) conflict,
    required R Function(UpgradeRequiredException exception) upgradeRequired,
    required R Function(ServiceUnavailableException exception) serviceUnavailable,
    required R Function(ServerErrorException exception) serverError,
    required R Function(ClientErrorException exception) clientError,
    required R Function(NetworkTimeoutException exception) networkTimeout,
    required R Function(NetworkCancelException exception) networkCancel,
    required R Function(NetworkException exception) networkError,
    required R Function(AuthorizationFailedException exception) authorizationFailed,
    required R Function(AuthorizationCanceledException exception) authorizationCanceled,
    required R Function(RequireReauthenticationException exception) reauthenticateRequired,
    required R Function(TooManyRequestsException exception) tooManyRequests,
    required R Function(UserNotFoundException exception) userNotFound,
    required R Function(CredentialAlreadyInUseException exception) credentialAlreadyInUse,
    required R Function(AccountExistsWithDifferentCredentialException exception) accountExistsWithDifferentCredential,
    required R Function(UserTokenExpiredException exception) userTokenExpired,
    required R Function(NotFoundInvitationException exception) notFoundInvitation,
    required R Function(Exception exception) otherException,
  }) {
    if (this is InvalidParamsException) {
      return invalidParams(this as InvalidParamsException);
    } else if (this is InvalidTokenException) {
      return invalidToken(this as InvalidTokenException);
    } else if (this is NotFoundException) {
      return notFound(this as NotFoundException);
    } else if (this is ConflictException) {
      return conflict(this as ConflictException);
    } else if (this is UpgradeRequiredException) {
      return upgradeRequired(this as UpgradeRequiredException);
    } else if (this is ServiceUnavailableException) {
      return serviceUnavailable(this as ServiceUnavailableException);
    } else if (this is ServerErrorException) {
      return serverError(this as ServerErrorException);
    } else if (this is ClientErrorException) {
      return clientError(this as ClientErrorException);
    } else if (this is NetworkTimeoutException) {
      return networkTimeout(this as NetworkTimeoutException);
    } else if (this is NetworkCancelException) {
      return networkCancel(this as NetworkCancelException);
    } else if (this is NetworkException) {
      return networkError(this as NetworkException);
    } else if (this is AuthorizationFailedException) {
      return authorizationFailed(this as AuthorizationFailedException);
    } else if (this is AuthorizationCanceledException) {
      return authorizationCanceled(this as AuthorizationCanceledException);
    } else if (this is RequireReauthenticationException) {
      return reauthenticateRequired(this as RequireReauthenticationException);
    } else if (this is TooManyRequestsException) {
      return tooManyRequests(this as TooManyRequestsException);
    } else if (this is UserNotFoundException) {
      return userNotFound(this as UserNotFoundException);
    } else if (this is CredentialAlreadyInUseException) {
      return credentialAlreadyInUse(this as CredentialAlreadyInUseException);
    } else if (this is AccountExistsWithDifferentCredentialException) {
      return accountExistsWithDifferentCredential(this as AccountExistsWithDifferentCredentialException);
    } else if (this is UserTokenExpiredException) {
      return userTokenExpired(this as UserTokenExpiredException);
    } else if (this is NotFoundInvitationException) {
      return notFoundInvitation(this as NotFoundInvitationException);
    } else {
      return otherException(this);
    }
  }
}
