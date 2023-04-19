import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_easy_loading.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/model/edit/editing_result.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:cueue/model/tag/tag_id.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog_event.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeleteTagData {
  const DeleteTagData(this.event, this.tagId);

  final SimpleMessageDialogEvent? event;
  final TagId tagId;
}

SWRTriggerState<Tag, void> useDeleteTag(WidgetRef ref) {
  final intl = useIntl();
  final pop = usePop<EditingResult>();
  final easyLoading = useEasyLoading();
  final showErrorDialog = useShowErrorDialog(ref);
  final deleteTagApi = ref.read(deleteTagApiProvider);
  final showConfirmDeleteTagDialog = useShowSimpleMessageDialog();
  final deleteTag = useSWRTrigger<TagId, bool>((tagId) async {
    await deleteTagApi(tagId.value);
    return true;
  });
  final confirmDeleteTag = useSWRTrigger<Tag, DeleteTagData>((tag) async {
    final event = await showConfirmDeleteTagDialog.trigger(
      SimpleMessageDialogData(
        title: intl.confirm,
        message: intl.confirmDeletingWith(tag.name),
        positiveButton: intl.doDelete,
        negativeButton: intl.cancel,
      ),
    );
    return DeleteTagData(event, tag.id);
  });
  useEffectSWRData<Tag, DeleteTagData>(confirmDeleteTag, (data) {
    data.event?.whenOrNull(
      positive: () => deleteTag.trigger(data.tagId),
    );
  });
  useEffectSWRData(deleteTag, (data) {
    pop.trigger(EditingResult.deleted);
  });
  useEffectSWRIsMutating(deleteTag, (isMutating) {
    easyLoading.trigger(isMutating);
  });
  useEffectSWRError(deleteTag, (error) {
    showErrorDialog.trigger(error);
  });
  return confirmDeleteTag;
}
