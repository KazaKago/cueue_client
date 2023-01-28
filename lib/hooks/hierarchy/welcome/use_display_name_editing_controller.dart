import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/model/user/pre_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

TextEditingController useDisplayNameEditingController(SWRState<String, PreUser> preUserState) {
  final displayNameEditingController = useTextEditingController();
  final isConsumed = useState(true);
  displayNameEditingController.addListener(() {
    final newPreUser = preUserState.data?.copyWith(displayName: displayNameEditingController.text);
    preUserState.mutate(null, optimisticData: newPreUser, revalidate: false);
  });
  useEffect(
    () {
      final preUser = preUserState.data;
      if (isConsumed.value && preUser != null) {
        displayNameEditingController.text = preUser.displayName;
        isConsumed.value = false;
      }
      return null;
    },
    [preUserState.data],
  );
  return displayNameEditingController;
}
