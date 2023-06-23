import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/hierarchy/tag/use_tags.dart';
import 'package:cueue/model/auth/firebase_auth_extension.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReOrderTagsData {
  ReOrderTagsData(this.oldIndex, this.newIndex);

  final int oldIndex;
  final int newIndex;
}

SWRTriggerState<ReOrderTagsData, void> useReOrderTags(WidgetRef ref) {
  final tagsState = useTags(ref);
  final orderTagApi = ref.read(orderTagApiProvider);
  final tagResponseMapper = ref.read(tagResponseMapperProvider);
  final tagOrderRequestMapper = ref.read(tagOrderRequestMapperProvider);
  return useSWRTrigger<ReOrderTagsData, void>((data) async {
    final tags = tagsState.data;
    if (tags == null) return;
    var fixedNewIndex = data.newIndex;
    if (data.oldIndex < data.newIndex) {
      fixedNewIndex -= 1;
    }
    final targetTag = tags[data.oldIndex];
    final fixedTags = List.of(tags)
      ..remove(targetTag)
      ..insert(fixedNewIndex, targetTag);
    await tagsState.mutate(
      () async {
        try {
          final request = tagOrderRequestMapper(fixedTags.map((tag) => tag.id).toList());
          final response = await orderTagApi(request);
          return response.map(tagResponseMapper.call).toList();
        } on FirebaseAuthException catch (exception) {
          throw await exception.parse();
        }
      },
      optimisticData: fixedTags,
      revalidate: false,
    );
  });
}
