import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'developer_info.freezed.dart';

@freezed
class DeveloperInfo with _$DeveloperInfo {
  const factory DeveloperInfo({
    required final String developer,
    required final Uri webSite,
    required final Email email,
  }) = _DeveloperInfo;

  const DeveloperInfo._();

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
