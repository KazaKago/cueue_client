import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/hooks/hierarchy/setting/use_get_app_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void Function() useShowLicensePage() {
  final context = useContext();
  final state = useGetAppInfo();
  return () {
    final appInfo = state.data;
    if (appInfo == null) return;
    return showLicensePage(
      context: context,
      applicationName: appInfo.appName,
      applicationVersion: appInfo.version,
      applicationIcon: Assets.images.icAppIcon.image(width: 128, height: 128),
      applicationLegalese: appInfo.copyright(),
    );
  };
}
