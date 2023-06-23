import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/model/user/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

TextEditingController useWorkspaceNameEditingController(SWRState<String, User> userState) {
  final intl = useIntl();
  final workspaceNameEditingController = useTextEditingController();
  final isConsumed = useState(true);
  useEffect(
    () {
      final user = userState.data;
      if (isConsumed.value && user != null) {
        workspaceNameEditingController.text = intl.defaultWorkspaceName(user.displayName);
        isConsumed.value = false;
      }
      return null;
    },
    [userState.data],
  );
  return workspaceNameEditingController;
}
