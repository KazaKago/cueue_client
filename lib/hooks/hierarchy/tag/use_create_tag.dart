import 'package:cueue/api/request/tag/tag_request.dart';
import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_easy_loading.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/model/edit/editing_result.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<String, Tag> useCreateTag(WidgetRef ref) {
  final pop = usePop<EditingResult>();
  final easyLoading = useEasyLoading();
  final showErrorDialog = useShowErrorDialog(ref);
  final createTagApi = ref.read(createTagApiProvider);
  final tagResponseMapper = ref.read(tagResponseMapperProvider);
  final createTag = useSWRTrigger<String, Tag>((name) async {
    final response = await createTagApi(TagRequest(name: name));
    return tagResponseMapper(response);
  });
  useEffectSWRData(createTag, (tag) {
    pop.trigger(EditingResult.created);
  });
  useEffectSWRIsMutating(createTag, (isMutating) {
    easyLoading.trigger(isMutating);
  });
  useEffectSWRError(createTag, (error) {
    showErrorDialog.trigger(error);
  });
  return createTag;
}
