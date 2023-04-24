import 'package:cueue/api/mapper/menu/time_frame_response_mapper.dart';
import 'package:cueue/api/mapper/recipe/recipe_summary_response_mapper.dart';
import 'package:cueue/api/response/menu/menu_response.dart';
import 'package:cueue/model/menu/menu.dart';
import 'package:cueue/model/menu/menu_id.dart';

class MenuResponseMapper {
  const MenuResponseMapper(this._timeFrameResponseMapper, this._recipeSummaryResponseMapper);

  final TimeFrameResponseMapper _timeFrameResponseMapper;
  final RecipeSummaryResponseMapper _recipeSummaryResponseMapper;

  Menu call(MenuResponse response) {
    return Menu(
      id: MenuId(response.id),
      memo: response.memo,
      date: DateTime.parse(response.date),
      timeFrame: _timeFrameResponseMapper(response.timeFrame),
      recipes: response.recipes.map(_recipeSummaryResponseMapper.call).toList(),
    );
  }
}
