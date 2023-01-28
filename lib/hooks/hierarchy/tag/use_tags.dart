import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/swr/use_swr.dart';
import 'package:cueue/model/auth/firebase_auth_extension.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRState<String, List<Tag>> useTags(WidgetRef ref) {
  final getTagsApi = ref.read(getTagsApiProvider);
  final tagResponseMapper = ref.read(tagResponseMapperProvider);
  final state = useSWR<String, List<Tag>>('tags', (_) async {
    try {
      final response = await getTagsApi();
      return response.map(tagResponseMapper.call).toList();
    } on auth.FirebaseAuthException catch (exception) {
      throw await exception.parse();
    }
  });
  return state;
}
