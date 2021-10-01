import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/presentation/view/global/widget/empty_widget.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/global/widget/shimmer_container.dart';
import 'package:cueue/presentation/view/hierarchy/tag/tag_editing_page.dart';
import 'package:cueue/presentation/view/hierarchy/tag/tag_loading_item.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/editing_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagPage extends HookConsumerWidget {
  const TagPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final state = ref.watch(tagViewModelProvider.select((viewModel) => viewModel.state));
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.tag),
      ),
      body: state.when(
        loading: () => _buildLoading(context, ref),
        empty: () => _buildEmpty(context, ref),
        completed: (tags) => _buildCompleted(context, ref, tags),
        error: (exception) => _buildError(context, ref, exception),
      ),
    );
  }

  Widget _buildLoading(final BuildContext context, final WidgetRef ref) {
    return ShimmerContainer(
      child: Wrap(
        direction: Axis.horizontal,
        children: List.filled(20, const TagLoadingItem()),
      ),
    );
  }

  Widget _buildEmpty(final BuildContext context, final WidgetRef ref) {
    return EmptyWidget(AppLocalizations.of(context)!.no_tag_message);
  }

  Widget _buildCompleted(final BuildContext context, final WidgetRef ref, final List<Tag> tags) {
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
              onTap: () => _goTagEditing(context, tags[index]),
            );
          },
        ),
      ),
    );
  }

  Widget _buildError(final BuildContext context, final WidgetRef ref, final Exception exception) {
    final viewModel = ref.read(tagViewModelProvider);
    return ErrorHandlingWidget(exception, onClickRetry: viewModel.retry);
  }

  Future<void> _goTagEditing(final BuildContext context, final Tag tag) async {
    await Navigator.push<EditingResult>(context, MaterialPageRoute(builder: (context) => TagEditingPage(tag: tag)));
  }
}
