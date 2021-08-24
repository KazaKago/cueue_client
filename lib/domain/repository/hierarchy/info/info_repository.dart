import 'package:cueue/domain/model/hierarchy/info/app_info.dart';
import 'package:cueue/domain/model/hierarchy/info/developer_info.dart';

abstract class InfoRepository {
  Future<AppInfo> getAppInfo();

  Future<DeveloperInfo> getDeveloperInfo();
}
