import 'package:cueue/model/tag/tag.dart';
import 'package:cueue/model/tag/tag_id.dart';
import 'package:cueue/ui/hierarchy/tag/tag_editing_page.dart';
import 'package:cueue/ui/hierarchy/tag/tag_loading.dart';
import 'package:cueue/ui/hierarchy/tag/tag_page.dart';
import 'package:widgetbook/widgetbook.dart';

final tagComponent = WidgetbookComponent(
  name: 'Tag',
  isExpanded: true,
  useCases: [
    WidgetbookUseCase(
      name: 'TagPage',
      builder: (_) => const TagPage(),
    ),
    WidgetbookUseCase(
      name: 'TagEditingPage',
      builder: (_) => const TagEditingPage(
        tag: Tag(
          id: TagId(0),
          name: 'tag name',
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'TagLoading',
      builder: (_) => const TagLoading(),
    ),
  ],
);
