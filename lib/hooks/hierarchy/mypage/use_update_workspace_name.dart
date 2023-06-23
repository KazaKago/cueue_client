import 'package:cueue/api/request/workspace/workspace_request.dart';
import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_user.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:cueue/ui/global/modal/text_field_dialog.dart';
import 'package:cueue/ui/global/modal/text_field_dialog_event.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<void, void> useUpdateWorkspaceName(WidgetRef ref) {
  final intl = useIntl();
  final userState = useUser(ref);
  final updateWorkspaceApi = ref.read(updateWorkspaceApiProvider);
  final workspaceResponseMapper = ref.read(workspaceResponseMapperProvider);
  final showDisplayNameInputDialog = useTextFieldDialog();
  final showErrorDialog = useShowErrorDialog(ref);
  final updateWorkspace = useSWRTrigger<String, void>((workspaceName) async {
    final newUser = userState.data?.copyWith(workspace: userState.data?.workspace?.copyWith(name: workspaceName));
    await userState.mutate(
      () async {
        final response = await updateWorkspaceApi(WorkspaceRequest(name: workspaceName));
        final workspace = workspaceResponseMapper(response);
        return userState.data?.copyWith(workspace: workspace);
      },
      optimisticData: newUser,
      revalidate: false,
    );
  });
  useEffectSWRError(updateWorkspace, (error) {
    showErrorDialog.trigger(error);
  });
  useEffectSWRData<TextFieldDialogEvent?>(showDisplayNameInputDialog, (event) {
    event?.maybeWhen(
      positive: (currentText, originalText) {
        updateWorkspace.trigger(currentText);
      },
      orElse: () {},
    );
  });
  return useSWRTrigger<void, void>((_) {
    return showDisplayNameInputDialog.trigger(
      TextFieldDialogData(
        title: intl.changeWorkspaceName,
        defaultText: userState.data?.displayName,
        keyboardType: TextInputType.name,
        positiveButton: intl.done,
        negativeButton: intl.cancel,
      ),
    );
  });
}
