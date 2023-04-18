import 'package:cueue/hooks/global/swr/swr_mutate.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/hierarchy/tag/use_reorder_tags.dart';
import 'package:cueue/hooks/hierarchy/tag/use_tags.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:cueue/ui/global/widget/default_state_widget.dart';
import 'package:cueue/ui/global/widget/empty_widget.dart';
import 'package:cueue/ui/hierarchy/tag/tag_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagPage extends HookConsumerWidget {
  const TagPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = useIntl();
    final tagsState = useTags(ref);
    final pushTagEditingPage = usePushTagEditingPage();
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.tag),
      ),
      body: DefaultStateWidget<List<Tag>>(
        state: tagsState,
        loadingChild: TagLoading.new,
        child: (tags) {
          if (tags.isNotEmpty) {
            return _buildContent(ref, tags, tagsState.mutate);
          } else {
            return _buildEmpty();
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(intl.addTag),
        onPressed: () => pushTagEditingPage.trigger(null),
        icon: const Icon(Icons.add),
        heroTag: intl.addRecipe,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildEmpty() {
    final intl = useIntl();
    return EmptyWidget(intl.noTagMessage);
  }

  Widget _buildContent(WidgetRef ref, List<Tag> tags, SWRMutate<String, List<Tag>> mutateTags) {
    final reorderTags = useReOrderTags(ref);
    final scrollController = useScrollController();
    final pushTagEditingPage = usePushTagEditingPage();
    return RefreshIndicator(
      onRefresh: () => mutateTags(null),
      child: Scrollbar(
        controller: scrollController,
        child: ReorderableListView.builder(
          scrollController: scrollController,
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
              onTap: () => pushTagEditingPage.trigger(tags[index]),
            );
          },
          onReorder: (int oldIndex, int newIndex) => reorderTags.trigger(ReOrderTagsData(oldIndex, newIndex)),
        ),
      ),
    );
  }
}
