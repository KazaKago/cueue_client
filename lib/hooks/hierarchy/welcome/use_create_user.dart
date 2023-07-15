import 'package:cueue/api/request/user/user_request.dart';
import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_easy_loading.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_firebase_user.dart';
import 'package:cueue/model/exception/no_such_element_exception.dart';
import 'package:cueue/model/user/pre_user.dart';
import 'package:cueue/model/user/user.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<PreUser, User> useCreateUser(WidgetRef ref) {
  final firebaseUserState = useFirebaseUser(ref);
  final createUserApi = ref.read(createUserApiProvider);
  final userResponseMapper = ref.read(userResponseMapperProvider);
  final goNamed = useGoNamed();
  final showErrorDialog = useShowErrorDialog(ref);
  final easyLoading = useEasyLoading();
  final createUser = useSWRTrigger<PreUser, User>((preUser) async {
    final firebaseUser = firebaseUserState.data;
    if (firebaseUser != null) {
      final userRequest = UserRequest(
        displayName: preUser.displayName,
        photoKey: preUser.photo?.key.value,
      );
      final userResponse = await createUserApi(userRequest);
      return userResponseMapper(firebaseUser, userResponse);
    } else {
      throw const NoSuchElementException();
    }
  });
  useEffectSWRData(createUser, (_) {
    goNamed.trigger(GoName('workspace_creation'));
  });
  useEffectSWRIsMutating(createUser, ({required isMutating}) {
    easyLoading.trigger(isMutating);
  });
  useEffectSWRError(createUser, (error) {
    showErrorDialog.trigger(error);
  });
  return createUser;
}
