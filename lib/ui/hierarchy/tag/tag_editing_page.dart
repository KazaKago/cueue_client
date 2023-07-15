import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/hierarchy/tag/use_create_tag.dart';
import 'package:cueue/hooks/hierarchy/tag/use_delete_tag.dart';
import 'package:cueue/hooks/hierarchy/tag/use_tag_for_edit.dart';
import 'package:cueue/hooks/hierarchy/tag/use_update_tag.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:cueue/model/tag/tag_id.dart';
import 'package:cueue/model/tag/tag_registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagEditingPage extends HookConsumerWidget {
  const TagEditingPage({super.key, this.tagId, this.tag});

  final TagId? tagId;
  final Tag? tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagState = useTagForEdit(ref, this.tagId, fallbackData: tag);
    final tagId = this.tagId;
    final intl = useIntl();
    final createTag = useCreateTag(ref);
    final updateTag = useUpdateTag(ref);
    final deleteTag = useDeleteTag(ref);
    final tagEditingController = useTextEditingController(text: tagState.data?.name, keys: [tagState.data?.name]);
    final isSubmitButtonEnabled = useState(tagState.data?.name.isNotEmpty == true);
    final scrollController = useScrollController();
    tagEditingController.addListener(() {
      isSubmitButtonEnabled.value = tagEditingController.text.isNotEmpty;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(tagId != null ? intl.editWith(tagState.data?.name ?? '') : intl.addTag),
        actions: [
          if (tagId != null)
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: intl.doDelete,
              onPressed: () => deleteTag.trigger(tagId),
            ),
        ],
      ),
      body: Scrollbar(
        controller: scrollController,
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
          children: <Widget>[
            TextField(
              controller: tagEditingController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: intl.tagName, alignLabelWithHint: true, border: const OutlineInputBorder()),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: Text(tagId != null ? intl.doFix : intl.doAdd),
                onPressed: isSubmitButtonEnabled.value
                    ? () {
                        if (tagId != null) {
                          updateTag.trigger(UpdateTagData(tagId, TagRegistration(name: tagEditingController.text)));
                        } else {
                          createTag.trigger(TagRegistration(name: tagEditingController.text));
                        }
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
