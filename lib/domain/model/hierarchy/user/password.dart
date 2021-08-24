import 'package:cueue/domain/model/global/exception/do_not_match_password_exception.dart';
import 'package:cueue/domain/model/global/exception/password_validation_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password.freezed.dart';

@freezed
class Password with _$Password {
  factory Password(final String value) = _Password;

  factory Password.validateMatch(final String value1, final String value2) {
    if (value1 != value2) throw DoNotMatchPasswordException(value1);
    return Password(value1);
  }

  Password._() {
    if (!RegExp(r'.{6,}').hasMatch(value)) {
      throw PasswordValidationException(value);
    }
  }
}
