import 'package:cueue/data/api/response/menu/menu_response.dart';
import 'package:cueue/data/mapper/hierarchy/menu/time_frame_response_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/recipe/recipe_summary_response_mapper.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';

class MenuResponseMapper {
  const MenuResponseMapper(this._timeFrameResponseMapper, this._recipeSummaryResponseMapper);

  final TimeFrameResponseMapper _timeFrameResponseMapper;
  final RecipeSummaryResponseMapper _recipeSummaryResponseMapper;

  Menu map(MenuResponse response) {
    return Menu(
      id: MenuId(response.id),
      memo: response.memo,
      date: DateTime.parse(response.date),
      timeFrame: _timeFrameResponseMapper.map(response.timeFrame),
      recipes: response.recipes.map(_recipeSummaryResponseMapper.map).toList(),
    );
  }
}
