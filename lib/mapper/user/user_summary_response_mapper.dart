import 'package:cueue/api/response/user/user_summary_response.dart';
import 'package:cueue/mapper/content/content_response_mapper.dart';
import 'package:cueue/model/user/user_id.dart';
import 'package:cueue/model/user/user_summary.dart';

class UserSummaryResponseMapper {
  const UserSummaryResponseMapper(this._contentResponseMapper);

  final ContentResponseMapper _contentResponseMapper;

  UserSummary call(UserSummaryResponse response) {
    return UserSummary(
      id: UserId(response.id),
      displayName: response.displayName,
      photo: response.photo != null ? _contentResponseMapper(response.photo!) : null,
    );
  }
}
