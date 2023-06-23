import 'package:cueue/api/request/user/user_request.dart';
import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_firebase_user.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_user.dart';
import 'package:cueue/model/exception/no_such_element_exception.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:cueue/ui/global/modal/text_field_dialog.dart';
import 'package:cueue/ui/global/modal/text_field_dialog_event.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<void, void> useUpdateDisplayName(WidgetRef ref) {
  final intl = useIntl();
  final userState = useUser(ref);
  final firebaseUserState = useFirebaseUser(ref);
  final updateUserApi = ref.read(updateUserApiProvider);
  final userResponseMapper = ref.read(userResponseMapperProvider);
  final showDisplayNameInputDialog = useTextFieldDialog();
  final showErrorDialog = useShowErrorDialog(ref);
  final updateUser = useSWRTrigger<String, void>((displayName) async {
    final newUser = userState.data?.copyWith(displayName: displayName);
    await userState.mutate(
      () async {
        final firebaseUser = firebaseUserState.data;
        if (firebaseUser != null) {
          final request = UserRequest(displayName: displayName, photoKey: newUser?.photo?.key.value);
          final response = await updateUserApi(request);
          return userResponseMapper(firebaseUser, response);
        } else {
          throw const NoSuchElementException();
        }
      },
      optimisticData: newUser,
      revalidate: false,
    );
  });
  useEffectSWRError(updateUser, (error) {
    showErrorDialog.trigger(error);
  });
  useEffectSWRData<TextFieldDialogEvent?>(showDisplayNameInputDialog, (event) {
    event?.maybeWhen(
      positive: (currentText, originalText) => updateUser.trigger(currentText),
      orElse: () {},
    );
  });
  return useSWRTrigger<void, void>((_) {
    return showDisplayNameInputDialog.trigger(
      TextFieldDialogData(
        title: intl.changeDisplayName,
        defaultText: userState.data?.displayName,
        keyboardType: TextInputType.name,
        positiveButton: intl.done,
        negativeButton: intl.cancel,
      ),
    );
  });
}
