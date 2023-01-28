import 'package:cueue/api/response/menu/menu_summary_response.dart';
import 'package:cueue/mapper/menu/time_frame_response_mapper.dart';
import 'package:cueue/mapper/recipe/recipe_summary_response_mapper.dart';
import 'package:cueue/model/menu/menu_id.dart';
import 'package:cueue/model/menu/menu_summary.dart';
import 'package:cueue/model/menu/menu_summary_impl.dart';

class MenuSummaryResponseMapper {
  const MenuSummaryResponseMapper(this._timeFrameResponseMapper, this._recipeSummaryResponseMapper);

  final TimeFrameResponseMapper _timeFrameResponseMapper;
  final RecipeSummaryResponseMapper _recipeSummaryResponseMapper;

  MenuSummary call(MenuSummaryResponse response) {
    return MenuSummaryImpl(
      id: MenuId(response.id),
      memo: response.memo,
      date: DateTime.parse(response.date),
      timeFrame: _timeFrameResponseMapper(response.timeFrame),
      recipes: response.recipes.map(_recipeSummaryResponseMapper.call).toList(),
    );
  }
}
