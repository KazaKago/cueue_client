import 'package:cueue/data/resource/hierarchy/app_info_constants.dart';
import 'package:cueue/domain/model/hierarchy/info/app_info.dart';
import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/domain/repository/hierarchy/info/info_repository.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfoRepositoryImpl implements AppInfoRepository {
  const AppInfoRepositoryImpl(this._appInfoConstants);

  final AppInfoConstants _appInfoConstants;

  @override
  Future<AppInfo> getAppInfo() async {
    final info = await PackageInfo.fromPlatform();
    return AppInfo(
      appName: info.appName,
      version: info.version,
      webSite: Uri.parse(_appInfoConstants.webSite),
      storeLink: Uri.parse(_appInfoConstants.storeLink),
      developer: _appInfoConstants.developer,
      email: Email(_appInfoConstants.email),
    );
  }
}
