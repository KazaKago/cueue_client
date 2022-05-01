import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchResultPage extends HookConsumerWidget {
  const SearchResultPage(this.keyword, this.tagIds, {Key? key}) : super(key: key);

  final String keyword;
  final List<TagId> tagIds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl(context).searchResultOf(keyword)),
      ),
      body: RecipeListWidget(keyword: keyword, tagIds: tagIds),
    );
  }
}
