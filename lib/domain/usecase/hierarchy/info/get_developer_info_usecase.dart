import 'package:cueue/domain/model/hierarchy/info/developer_info.dart';

abstract class GetDeveloperInfoUseCase {
  Future<DeveloperInfo> call();
}
