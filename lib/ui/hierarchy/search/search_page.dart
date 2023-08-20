import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:cueue/model/tag/tag_id.dart';
import 'package:cueue/ui/hierarchy/search/search_result_page.dart';
import 'package:cueue/ui/hierarchy/tag/tag_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchPage extends HookConsumerWidget with RouteAware {
  const SearchPage({super.key, this.initialSelectedRecipes});

  final List<RecipeSummary>? initialSelectedRecipes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = useIntl();
    final popPage = usePopPage<List<RecipeSummary>?>();
    final selectedTagIds = useState<List<TagId>>([]);
    final keywordEditingController = useTextEditingController();
    final isEnableSubmitButton = useState(keywordEditingController.text.isNotEmpty);
    keywordEditingController.addListener(() {
      isEnableSubmitButton.value = keywordEditingController.text.isNotEmpty;
    });
    final selectedRecipes = useState<List<RecipeSummary>?>(initialSelectedRecipes);
    final scrollController = useScrollController();
    return WillPopScope(
      onWillPop: () async {
        if (initialSelectedRecipes != null) {
          await popPage.trigger(selectedRecipes.value);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(intl.search),
        ),
        body: Scrollbar(
          controller: scrollController,
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
            children: <Widget>[
              _buildSearchText(keywordEditingController),
              const SizedBox(height: 16),
              _buildTagTitle(),
              const SizedBox(height: 4),
              TagChips(selectedTagIds),
              const SizedBox(height: 24),
              _buildSubmitButton(keywordEditingController, selectedTagIds.value, selectedRecipes, isEnableSubmitButton.value),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didPushNext() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Widget _buildSearchText(TextEditingController recipeTitleEditingController) {
    final intl = useIntl();
    return TextField(
      controller: recipeTitleEditingController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: intl.searchKeyword, alignLabelWithHint: true, border: const OutlineInputBorder()),
    );
  }

  Widget _buildTagTitle() {
    final intl = useIntl();
    return Text(intl.filterByTags);
  }

  Widget _buildSubmitButton(TextEditingController keyword, List<TagId> selectedTagIds, ValueNotifier<List<RecipeSummary>?> selectedRecipes, bool isEnableSubmitButton) {
    final intl = useIntl();
    final pushPage = usePushPage<List<RecipeSummary>>();
    useEffectSWRData<List<RecipeSummary>?>(pushPage, (data) {
      if (data != null) selectedRecipes.value = data;
    });
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.search),
        label: Text(intl.doSearch),
        onPressed: isEnableSubmitButton ? () => pushPage.trigger(SearchResultPage(keyword.text, selectedTagIds, initialSelectedRecipes: selectedRecipes.value)) : null,
      ),
    );
  }
}
