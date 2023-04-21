import 'package:cueue/hooks/hierarchy/tag/use_tags.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:cueue/model/tag/tag_id.dart';
import 'package:cueue/ui/global/widget/default_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagChips extends HookConsumerWidget {
  const TagChips(this.selectedTagIds, {super.key});

  final ValueNotifier<List<TagId>> selectedTagIds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagsState = useTags(ref);
    return DefaultStateWidget<List<Tag>>(
      state: tagsState,
      child: _buildTagChipsContent,
    );
  }

  Widget _buildTagChipsContent(List<Tag> tags) {
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
}
