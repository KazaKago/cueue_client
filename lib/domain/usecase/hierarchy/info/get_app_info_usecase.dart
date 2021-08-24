import 'package:cueue/domain/model/hierarchy/info/app_info.dart';

abstract class GetAppInfoUseCase {
  Future<AppInfo> call();
}
