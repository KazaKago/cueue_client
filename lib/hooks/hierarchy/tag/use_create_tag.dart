import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_easy_loading.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/model/edit/editing_result.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:cueue/model/tag/tag_registration.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<TagRegistration, Tag> useCreateTag(WidgetRef ref) {
  final popPage = usePopPage<EditingResult>();
  final easyLoading = useEasyLoading();
  final showErrorDialog = useShowErrorDialog(ref);
  final createTagApi = ref.read(createTagApiProvider);
  final tagResponseMapper = ref.read(tagResponseMapperProvider);
  final tagRequestMapper = ref.read(tagRequestMapperProvider);
  final createTag = useSWRTrigger<TagRegistration, Tag>((tagRegistration) async {
    final response = await createTagApi(tagRequestMapper(tagRegistration));
    return tagResponseMapper(response);
  });
  useEffectSWRData(createTag, (data) {
    popPage.trigger(EditingResult.created);
  });
  useEffectSWRIsMutating(createTag, ({required isMutating}) {
    easyLoading.trigger(isMutating);
  });
  useEffectSWRError(createTag, (error) {
    showErrorDialog.trigger(error);
  });
  return createTag;
}
