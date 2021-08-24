import 'package:cueue/domain/model/global/exception/account_exists_with_different_credential_exception.dart';
import 'package:cueue/domain/model/global/exception/autorization_cancel_exception.dart';
import 'package:cueue/domain/model/global/exception/autorization_failed_exception.dart';
import 'package:cueue/domain/model/global/exception/client_error_exception.dart';
import 'package:cueue/domain/model/global/exception/conflict_exception.dart';
import 'package:cueue/domain/model/global/exception/credential_already_in_use_exception.dart';
import 'package:cueue/domain/model/global/exception/do_not_match_password_exception.dart';
import 'package:cueue/domain/model/global/exception/email_already_in_use_exception.dart';
import 'package:cueue/domain/model/global/exception/email_validation_exception.dart';
import 'package:cueue/domain/model/global/exception/invalid_params_exception.dart';
import 'package:cueue/domain/model/global/exception/invalid_token_exception.dart';
import 'package:cueue/domain/model/global/exception/network_cancel_exception.dart';
import 'package:cueue/domain/model/global/exception/network_exception.dart';
import 'package:cueue/domain/model/global/exception/network_timeout_exception.dart';
import 'package:cueue/domain/model/global/exception/not_found_exception.dart';
import 'package:cueue/domain/model/global/exception/password_validation_exception.dart';
import 'package:cueue/domain/model/global/exception/require_reautentication_exception.dart';
import 'package:cueue/domain/model/global/exception/server_error_exception.dart';
import 'package:cueue/domain/model/global/exception/service_unavailable_exception.dart';
import 'package:cueue/domain/model/global/exception/too_many_requests_exception.dart';
import 'package:cueue/domain/model/global/exception/upgrade_required_exception.dart';
import 'package:cueue/domain/model/global/exception/user_not_found_exception.dart';
import 'package:cueue/domain/model/global/exception/user_token_expired_exception.dart';
import 'package:cueue/domain/model/global/exception/wrong_password_exception.dart';

extension ExceptionExtension on Exception {
  R when<R>({
    required final R Function(InvalidParamsException exception) invalidParams,
    required final R Function(InvalidTokenException exception) invalidToken,
    required final R Function(NotFoundException exception) notFound,
    required final R Function(ConflictException exception) conflict,
    required final R Function(UpgradeRequiredException exception) upgradeRequired,
    required final R Function(ServiceUnavailableException exception) serviceUnavailable,
    required final R Function(ServerErrorException exception) serverError,
    required final R Function(ClientErrorException exception) clientError,
    required final R Function(NetworkTimeoutException exception) networkTimeout,
    required final R Function(NetworkCancelException exception) networkCancel,
    required final R Function(NetworkException exception) networkError,
    required final R Function(AuthorizationFailedException exception) authorizationFailed,
    required final R Function(AuthorizationCanceledException exception) authorizationCanceled,
    required final R Function(EmailValidationException exception) invalidEmail,
    required final R Function(PasswordValidationException exception) invalidPassword,
    required final R Function(DoNotMatchPasswordException exception) doNotMatchPassword,
    required final R Function(RequireReauthenticationException exception) reauthenticateRequired,
    required final R Function(WrongPasswordException exception) wrongPassword,
    required final R Function(TooManyRequestsException exception) tooManyRequests,
    required final R Function(UserNotFoundException exception) userNotFound,
    required final R Function(EmailAlreadyInUseException exception) emailAlreadyInUse,
    required final R Function(CredentialAlreadyInUseException exception) credentialAlreadyInUse,
    required final R Function(AccountExistsWithDifferentCredentialException exception) accountExistsWithDifferentCredential,
    required final R Function(UserTokenExpiredException exception) userTokenExpired,
    required final R Function(Exception exception) otherException,
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
    } else if (this is EmailValidationException) {
      return invalidEmail(this as EmailValidationException);
    } else if (this is PasswordValidationException) {
      return invalidPassword(this as PasswordValidationException);
    } else if (this is DoNotMatchPasswordException) {
      return doNotMatchPassword(this as DoNotMatchPasswordException);
    } else if (this is RequireReauthenticationException) {
      return reauthenticateRequired(this as RequireReauthenticationException);
    } else if (this is WrongPasswordException) {
      return wrongPassword(this as WrongPasswordException);
    } else if (this is TooManyRequestsException) {
      return tooManyRequests(this as TooManyRequestsException);
    } else if (this is UserNotFoundException) {
      return userNotFound(this as UserNotFoundException);
    } else if (this is EmailAlreadyInUseException) {
      return emailAlreadyInUse(this as EmailAlreadyInUseException);
    } else if (this is CredentialAlreadyInUseException) {
      return credentialAlreadyInUse(this as CredentialAlreadyInUseException);
    } else if (this is AccountExistsWithDifferentCredentialException) {
      return accountExistsWithDifferentCredential(this as AccountExistsWithDifferentCredentialException);
    } else if (this is UserTokenExpiredException) {
      return userTokenExpired(this as UserTokenExpiredException);
    } else {
      return otherException(this);
    }
  }
}
