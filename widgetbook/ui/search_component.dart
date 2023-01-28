import 'package:cueue/model/tag/tag_id.dart';
import 'package:cueue/ui/hierarchy/search/search_page.dart';
import 'package:cueue/ui/hierarchy/search/search_result_page.dart';
import 'package:widgetbook/widgetbook.dart';

final searchComponent = WidgetbookComponent(
  name: 'Search',
  isExpanded: true,
  useCases: [
    WidgetbookUseCase(
      name: 'SearchPage',
      builder: (_) => const SearchPage(),
    ),
    WidgetbookUseCase(
      name: 'SearchResultPage',
      builder: (_) => const SearchResultPage(
        'search keyword',
        [
          TagId(0),
          TagId(1),
          TagId(2),
        ],
        initialSelectedRecipes: [],
      ),
    ),
  ],
);
