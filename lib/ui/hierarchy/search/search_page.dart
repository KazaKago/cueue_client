import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/hierarchy/tag/use_tags.dart';
import 'package:cueue/legacy/presentation/view/global/l10n/intl.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:cueue/model/tag/tag_id.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:cueue/ui/global/utils/route_observer.dart';
import 'package:cueue/ui/global/widget/default_state_widget.dart';
import 'package:cueue/ui/hierarchy/search/search_result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchPage extends HookConsumerWidget with RouteAware {
  const SearchPage({super.key, this.initialSelectedRecipes});

  final List<RecipeSummary>? initialSelectedRecipes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popPage = usePopPage<List<RecipeSummary>?>();
    final modalRoute = ModalRoute.of(context)!;
    useEffect(() {
      routeObserver.subscribe(this, modalRoute);
      return () => routeObserver.unsubscribe(this);
    });
    final selectedTagIds = useState(<TagId>[]);
    final keywordEditingController = useTextEditingController();
    final isEnableSubmitButton = useState(keywordEditingController.text.isNotEmpty);
    keywordEditingController.addListener(() {
      isEnableSubmitButton.value = keywordEditingController.text.isNotEmpty;
    });
    final selectedRecipes = (initialSelectedRecipes != null) ? useState<List<RecipeSummary>>(initialSelectedRecipes!) : null;
    final scrollController = useScrollController();
    return WillPopScope(
      onWillPop: () async {
        if (initialSelectedRecipes != null) {
          await popPage.trigger(selectedRecipes?.value);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(intl(context).search),
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
              _buildTagChips(ref, selectedTagIds),
              const SizedBox(height: 24),
              _buildSubmitButton(context, keywordEditingController, selectedTagIds.value, selectedRecipes, isEnableSubmitButton.value),
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

  Widget _buildTagChips(WidgetRef ref, ValueNotifier<List<TagId>> selectedTagIds) {
    final tagsState = useTags(ref);
    return DefaultStateWidget<List<Tag>>(
      state: tagsState,
      child: (tags) => _buildTagChipsContent(tags, selectedTagIds),
    );
  }

  Widget _buildTagChipsContent(List<Tag> tags, ValueNotifier<List<TagId>> selectedTagIds) {
    return Wrap(
      spacing: 12,
      children: tags.map((e) {
        return FilterChip(
          label: Text(e.name),
          selected: selectedTagIds.value.contains(e.id),
          onSelected: (bool value) {
            if (value) {
              selectedTagIds.value = List.from(selectedTagIds.value..add(e.id));
            } else {
              selectedTagIds.value = List.from(selectedTagIds.value..remove(e.id));
            }
          },
        );
      }).toList(),
    );
  }

  Widget _buildSubmitButton(BuildContext context, TextEditingController keyword, List<TagId> selectedTagIds, ValueNotifier<List<RecipeSummary>>? selectedRecipes, bool isEnableSubmitButton) {
    final pushPage = usePushPage<List<RecipeSummary>>();
    useEffectSWRData<List<RecipeSummary>?>(pushPage, (data) {
      if (data != null) selectedRecipes?.value = data;
    });
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.search),
        label: Text(intl(context).doSearch),
        onPressed: isEnableSubmitButton ? () => pushPage.trigger(SearchResultPage(keyword.text, selectedTagIds, initialSelectedRecipes: selectedRecipes?.value)) : null,
      ),
    );
  }
}
