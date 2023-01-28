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

extension ExceptionExtension on Exception {
  R when<R>({
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
