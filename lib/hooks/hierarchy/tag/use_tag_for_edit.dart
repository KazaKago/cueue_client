import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_immutable.dart';
import 'package:cueue/model/auth/firebase_auth_extension.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:cueue/model/tag/tag_id.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRState<TagId, Tag> useTagForEdit(WidgetRef ref, TagId? tagId, {Tag? fallbackData}) {
  final getTagApi = ref.read(getTagApiProvider);
  final tagResponseMapper = ref.read(tagResponseMapperProvider);
  final state = useSWRImmutable<TagId, Tag>(
    tagId,
    (tagId) async {
      try {
        final response = await getTagApi(tagId: tagId.value);
        return tagResponseMapper(response);
      } on auth.FirebaseAuthException catch (exception) {
        throw await exception.parse();
      }
    },
    fallbackData: fallbackData,
  );
  return state;
}
