import 'package:cueue/api/request/tag/tag_request.dart';
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
import 'package:cueue/provider/mapper_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdateTagsData {
  UpdateTagsData(this.tagId, this.name);

  final TagId tagId;
  final String name;
}

SWRTriggerState<UpdateTagsData, Tag> useUpdateTag(WidgetRef ref) {
  final pop = usePop<EditingResult>();
  final easyLoading = useEasyLoading();
  final showErrorDialog = useShowErrorDialog(ref);
  final updateTagApi = ref.read(updateTagApiProvider);
  final tagResponseMapper = ref.read(tagResponseMapperProvider);
  final updateTag = useSWRTrigger<UpdateTagsData, Tag>((data) async {
    final response = await updateTagApi(data.tagId.value, TagRequest(name: data.name));
    return tagResponseMapper(response);
  });
  useEffectSWRData(updateTag, (tag) {
    pop.trigger(EditingResult.updated);
  });
  useEffectSWRIsMutating(updateTag, (isMutating) {
    easyLoading.trigger(isMutating);
  });
  useEffectSWRError(updateTag, (error) {
    showErrorDialog.trigger(error);
  });
  return updateTag;
}
