import 'package:cueue/data/api/request/menu/menu_request.dart';
import 'package:cueue/data/mapper/hierarchy/menu/time_frame_request_mapper.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_registration.dart';
import 'package:intl/intl.dart';

class MenuRequestMapper {
  MenuRequestMapper(this._timeFrameRequestMapper);

  final _formatter = DateFormat('yyyy-MM-dd');
  final TimeFrameRequestMapper _timeFrameRequestMapper;

  MenuRequest map(final MenuRegistration menuRegistration) {
    return MenuRequest(
      memo: menuRegistration.memo,
      date: _formatter.format(menuRegistration.date),
      timeFrame: _timeFrameRequestMapper.map(menuRegistration.timeFrame),
      recipeIds: menuRegistration.recipeIds.map((e) => e.value).toList(),
    );
  }
}
