import 'package:cueue/data/api/response/user/user_summary_response.dart';
import 'package:cueue/data/mapper/hierarchy/content/content_response_mapper.dart';
import 'package:cueue/domain/model/hierarchy/user/user_id.dart';
import 'package:cueue/domain/model/hierarchy/user/user_summary.dart';

class UserSummaryResponseMapper {
  const UserSummaryResponseMapper(this._contentResponseMapper);

  final ContentResponseMapper _contentResponseMapper;

  UserSummary map(UserSummaryResponse response) {
    return UserSummary(
      id: UserId(response.id),
      displayName: response.displayName,
      photo: response.photo != null ? _contentResponseMapper.map(response.photo!) : null,
    );
  }
}
