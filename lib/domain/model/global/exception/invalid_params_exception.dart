import 'package:cueue/domain/model/global/exception/client_error_exception.dart';

class InvalidParamsException implements ClientErrorException {
  const InvalidParamsException(this.message);

  final String message;
}
