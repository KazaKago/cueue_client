import 'package:cueue/data/resource/hierarchy/developer_info_constants.dart';
import 'package:cueue/domain/model/hierarchy/info/app_info.dart';
import 'package:cueue/domain/model/hierarchy/info/developer_info.dart';
import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/domain/repository/hierarchy/info/info_repository.dart';
import 'package:package_info_plus/package_info_plus.dart';

class InfoRepositoryImpl implements InfoRepository {
  const InfoRepositoryImpl();

  @override
  Future<AppInfo> getAppInfo() async {
    final info = await PackageInfo.fromPlatform();
    return AppInfo(appName: info.appName, version: info.version);
  }

  @override
  Future<DeveloperInfo> getDeveloperInfo() async {
    return DeveloperInfo(
      developer: DeveloperInfoConstants.developer,
      webSite: DeveloperInfoConstants.webSite,
      email: Email(DeveloperInfoConstants.email),
    );
  }
}
