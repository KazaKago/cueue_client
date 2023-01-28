import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/swr/use_swr.dart';
import 'package:cueue/model/auth/firebase_user.dart';
import 'package:cueue/provider/firebase_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRState<String, FirebaseUser?> useFirebaseUser(WidgetRef ref) {
  final firebaseUser = ref.watch(streamFirebaseUserProvider);
  final firebaseState = useSWR<String, FirebaseUser?>(
    'firebase_user__$firebaseUser',
    (key) async => firebaseUser.valueOrNull,
    fallbackData: ref.read(getFirebaseUserProvider),
  );
  return firebaseState;
}
