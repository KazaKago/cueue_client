import 'dart:convert';

import 'package:cueue/api/request/content/content_request.dart';
import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_immutable.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_firebase_user.dart';
import 'package:cueue/model/user/pre_user.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_flowable/store_flowable.dart';

SWRState<String, PreUser> usePreUser(WidgetRef ref) {
  final getBytesFromUriApi = ref.read(getBytesFromUriApiProvider);
  final createContentApi = ref.read(createContentApiProvider);
  final contentResponseMapper = ref.read(contentResponseMapperProvider);
  final firebaseUserState = useFirebaseUser(ref);
  final state = useSWRImmutable('pre_user', (_) async {
    final firebaseUser = firebaseUserState.data;
    if (firebaseUser != null) {
      final displayName = firebaseUser.displayName ?? firebaseUser.email ?? '';
      final photoUrl = firebaseUser.photoURL;
      if (photoUrl != null) {
        final bytes = await getBytesFromUriApi(Uri.parse(photoUrl));
        final request = ContentRequest(data: base64Encode(bytes));
        final photoResponse = await createContentApi(request);
        final photoContent = contentResponseMapper(photoResponse);
        return PreUser(displayName: displayName, photo: photoContent);
      } else {
        return PreUser(displayName: displayName, photo: null);
      }
    } else {
      throw const NoSuchElementException();
    }
  });
  return state;
}
