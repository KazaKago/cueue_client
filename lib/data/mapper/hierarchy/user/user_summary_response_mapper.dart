import 'package:cueue/data/api/response/user/user_summary_response.dart';
import 'package:cueue/domain/model/hierarchy/user/user_id.dart';
import 'package:cueue/domain/model/hierarchy/user/user_summary.dart';

class UserSummaryResponseMapper {
  const UserSummaryResponseMapper();

  UserSummary map(UserSummaryResponse response) {
    return UserSummary(
      id: UserId(response.id),
    );
  }
}
