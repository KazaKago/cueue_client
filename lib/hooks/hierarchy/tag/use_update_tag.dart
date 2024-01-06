import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_overlay_loading.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:cueue/model/tag/tag_id.dart';
import 'package:cueue/model/tag/tag_registration.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdateTagData {
  UpdateTagData(this.tagId, this.tagRegistration);

  final TagId tagId;
  final TagRegistration tagRegistration;
}

SWRTriggerState<UpdateTagData, Tag> useUpdateTag(WidgetRef ref) {
  final goNamed = useGoNamed();
  final overlayLoading = useOverlayLoading();
  final showErrorDialog = useShowErrorDialog(ref);
  final updateTagApi = ref.read(updateTagApiProvider);
  final tagResponseMapper = ref.read(tagResponseMapperProvider);
  final tagRequestMapper = ref.read(tagRequestMapperProvider);
  final updateTag = useSWRTrigger<UpdateTagData, Tag>((data) async {
    final response = await updateTagApi(data.tagId.value, tagRequestMapper(data.tagRegistration));
    return tagResponseMapper(response);
  });
  useEffectSWRData(updateTag, (data) {
    goNamed.trigger(GoName('tags'));
  });
  useEffectSWRIsMutating(updateTag, ({required isMutating}) {
    overlayLoading.trigger(isMutating);
  });
  useEffectSWRError(updateTag, (error) {
    showErrorDialog.trigger(error);
  });
  return updateTag;
}
