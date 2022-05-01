import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/widget/empty_widget.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/global/widget/shimmer_container.dart';
import 'package:cueue/presentation/view/hierarchy/tag/tag_editing_page.dart';
import 'package:cueue/presentation/view/hierarchy/tag/tag_loading_item.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/editing_result.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagPage extends HookConsumerWidget {
  const TagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tagViewModelProvider.select((viewModel) => viewModel.state));
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
      floatingActionButton: FloatingActionButton(
        tooltip: intl(context).addTag,
        onPressed: () => _goTagEditing(context),
        child: const Icon(Icons.add),
      ),
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
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: tags.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(tags[index].name),
              onTap: () => _goTagEditing(context, tag: tags[index]),
            );
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
