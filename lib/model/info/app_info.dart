import 'package:cueue/model/user/email.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_info.freezed.dart';

@freezed
class AppInfo with _$AppInfo {
  const factory AppInfo({
    required String appName,
    required String version,
    required Uri webSite,
    required Uri storeLink,
    required String developer,
    required Email email,
  }) = _AppInfo;

  const AppInfo._();

  static const _createdAtYear = 2021;

  String copyright() {
    final currentYear = DateTime.now().year;
    String copyrightYearStr;
    if (_createdAtYear < currentYear) {
      copyrightYearStr = '$_createdAtYear-$currentYear';
    } else {
      copyrightYearStr = '$_createdAtYear';
    }
    return '© $copyrightYearStr $developer';
  }
}
