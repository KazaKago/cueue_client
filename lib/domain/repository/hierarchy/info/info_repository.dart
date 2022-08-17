import 'package:cueue/domain/model/hierarchy/info/app_info.dart';

abstract class AppInfoRepository {
  Future<AppInfo> getAppInfo();
}
