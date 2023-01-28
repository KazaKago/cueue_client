import 'package:cueue/hooks/hierarchy/mypage/use_user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

bool useIsGoogleLinked(WidgetRef ref) {
  final userState = useUser(ref);
  return userState.data?.isGoogleLinked() == true;
}
