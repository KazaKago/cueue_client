import 'package:cueue/domain/model/global/exception/client_error_exception.dart';

class NotFoundException implements ClientErrorException {
  const NotFoundException();
}
