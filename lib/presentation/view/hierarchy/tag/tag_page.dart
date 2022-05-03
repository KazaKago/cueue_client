import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/global/widget/empty_widget.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/global/widget/shimmer_container.dart';
import 'package:cueue/presentation/view/hierarchy/tag/tag_editing_page.dart';
import 'package:cueue/presentation/view/hierarchy/tag/tag_loading_item.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/editing_result.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagPage extends HookConsumerWidget {
  const TagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tagViewModelProvider.select((viewModel) => viewModel.state));
    ref.listen<Event<Exception>>(
      tagViewModelProvider.select((viewModel) => viewModel.exceptionEvent),
      (previous, exceptionEvent) {
        exceptionEvent((exception) => const ExceptionHandler().showSnackBar(context, ref, exception));
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(intl(context).tag),
      ),
      body: state.when(
        loading: () => _buildLoading(context, ref),
        empty: () => _buildEmpty(context, ref),
        completed: (tags) => _buildCompleted(context, ref, tags),
        error: (exception) => _buildError(context, ref, exception),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(intl(context).addTag),
        onPressed: () => _goTagEditing(context),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildLoading(BuildContext context, WidgetRef ref) {
    return ShimmerContainer(
      child: Wrap(
        children: List.filled(20, const TagLoadingItem()),
      ),
    );
  }

  Widget _buildEmpty(BuildContext context, WidgetRef ref) {
    return EmptyWidget(intl(context).noTagMessage);
  }

  Widget _buildCompleted(BuildContext context, WidgetRef ref, List<Tag> tags) {
    final viewModel = ref.read(tagViewModelProvider);
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: Scrollbar(
        child: ReorderableListView.builder(
          padding: const EdgeInsets.only(bottom: 70),
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: tags.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              contentPadding: const EdgeInsets.only(left: 16),
              key: Key(tags[index].id.value.toString()),
              title: Text(tags[index].name),
              trailing: ReorderableDragStartListener(
                index: index,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: const Icon(Icons.drag_handle),
                ),
              ),
              onTap: () => _goTagEditing(context, tag: tags[index]),
            );
          },
          onReorder: (int oldIndex, int newIndex) {
            viewModel.reorder(tags, oldIndex, newIndex);
          },
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, WidgetRef ref, Exception exception) {
    final viewModel = ref.read(tagViewModelProvider);
    return ErrorHandlingWidget(exception, onClickRetry: viewModel.retry);
  }

  Future<void> _goTagEditing(BuildContext context, {Tag? tag}) async {
    await Navigator.push<EditingResult>(context, MaterialPageRoute(builder: (context) => TagEditingPage(tag: tag)));
  }
}
