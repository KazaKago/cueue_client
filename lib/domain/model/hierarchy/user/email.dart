import 'package:cueue/domain/model/global/exception/email_validation_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email.freezed.dart';

@freezed
class Email with _$Email {
  factory Email(final String value) = _Email;

  Email._() {
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      throw EmailValidationException(value);
    }
  }

  Uri mailTo() {
    return Uri.parse('mailto:$value');
  }
}
