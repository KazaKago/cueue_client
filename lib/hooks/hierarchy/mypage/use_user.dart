import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/swr/use_swr.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_firebase_user.dart';
import 'package:cueue/model/auth/firebase_auth_extension.dart';
import 'package:cueue/model/user/user.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_flowable/store_flowable.dart';

SWRState<String, User> useUser(WidgetRef ref) {
  final firebaseUserState = useFirebaseUser(ref);
  final getUserApi = ref.read(getUserApiProvider);
  final userResponseMapper = ref.read(userResponseMapperProvider);
  final state = useSWR<String, User>(firebaseUserState.data?.toString(), (_) async {
    final firebaseUser = firebaseUserState.data;
    if (firebaseUser != null) {
      try {
        final userResponse = await getUserApi();
        return userResponseMapper(firebaseUser, userResponse);
      } on auth.FirebaseAuthException catch (exception) {
        throw await exception.parse();
      }
    } else {
      throw const NoSuchElementException();
    }
  });
  return state;
}
