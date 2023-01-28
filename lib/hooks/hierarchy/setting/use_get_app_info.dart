import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/swr/use_swr.dart';
import 'package:cueue/model/info/app_info.dart';
import 'package:cueue/model/info/app_info_constants.dart';
import 'package:cueue/model/user/email.dart';
import 'package:package_info_plus/package_info_plus.dart';

SWRState<String, AppInfo> useGetAppInfo() {
  return useSWR('app_info', (_) async {
    final packageInfo = await PackageInfo.fromPlatform();
    final appInfo = AppInfoConstants();
    return AppInfo(
      appName: packageInfo.appName,
      version: packageInfo.version,
      webSite: Uri.parse(appInfo.webSite),
      storeLink: Uri.parse(appInfo.storeLink),
      developer: appInfo.developer,
      email: Email(appInfo.email),
    );
  });
}
