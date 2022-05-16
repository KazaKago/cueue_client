import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/utils/route_observer.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/hierarchy/search/search_result_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchPage extends HookConsumerWidget with RouteAware {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modalRoute = ModalRoute.of(context)!;
    useEffect(() {
      routeObserver.subscribe(this, modalRoute);
      return () => routeObserver.unsubscribe(this);
    });
    final selectedTagIds = useState(<TagId>[]);
    final keyword = useState('');
    final keywordEditingController = useTextEditingController();
    keywordEditingController.addListener(() {
      keyword.value = keywordEditingController.text;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(intl(context).search),
      ),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
          children: <Widget>[
            _buildSearchText(context, ref, keywordEditingController),
            const SizedBox(height: 16),
            _buildTagTitle(context),
            const SizedBox(height: 4),
            _buildTagChips(context, ref, selectedTagIds),
            const SizedBox(height: 24),
            _buildSubmitButton(context, ref, keyword.value, selectedTagIds.value),
          ],
        ),
      ),
    );
  }

  @override
  void didPushNext() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Widget _buildSearchText(BuildContext context, WidgetRef ref, TextEditingController recipeTitleEditingController) {
    return TextField(
      controller: recipeTitleEditingController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: intl(context).searchKeyword, alignLabelWithHint: true, border: const OutlineInputBorder()),
    );
  }

  Widget _buildTagTitle(BuildContext context) {
    return Text(intl(context).filterByTags);
  }

  Widget _buildTagChips(BuildContext context, WidgetRef ref, ValueNotifier<List<TagId>> selectedTagIds) {
    final state = ref.watch(searchViewModelProvider.select((viewModel) => viewModel.state));
    return state.when(
      loading: () => _buildTagChipsLoading(context, ref),
      completed: (tags) => _buildTagChipsCompleted(context, ref, tags, selectedTagIds),
      error: (exception) => _buildTagChipsError(context, ref, exception),
    );
  }

  Widget _buildTagChipsLoading(BuildContext context, WidgetRef ref) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildTagChipsCompleted(BuildContext context, WidgetRef ref, List<Tag> tags, ValueNotifier<List<TagId>> selectedTagIds) {
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

  Widget _buildTagChipsError(BuildContext context, WidgetRef ref, Exception exception) {
    final viewModel = ref.read(searchViewModelProvider);
    return ErrorHandlingWidget(exception, onClickRetry: viewModel.retry);
  }

  Widget _buildSubmitButton(BuildContext context, WidgetRef ref, String keyword, List<TagId> selectedTagIds) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.search),
        label: Text(intl(context).doSearch),
        onPressed: keyword.isEmpty ? null : () => _goSearchResult(context, keyword, selectedTagIds),
      ),
    );
  }

  Future<void> _goSearchResult(BuildContext context, String keyword, List<TagId> selectedTagIds) async {
    await Navigator.push(context, MaterialPageRoute<void>(builder: (context) => SearchResultPage(keyword, selectedTagIds)));
  }
}
