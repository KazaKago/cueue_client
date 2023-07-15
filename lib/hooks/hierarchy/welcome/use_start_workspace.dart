import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/hierarchy/welcome/use_create_workspace.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<void, void> useStartWorkspace(
  WidgetRef ref,
  ValueNotifier<StartWorkspaceState> selectionState,
  TextEditingController nameEditingController,
  TextEditingController codeEditingController,
) {
  final createWorkspace = useCreateWorkspace(ref);
  final goNamed = useGoNamed();
  final startWorkspace = useSWRTrigger<void, void>((name) async {
    switch (selectionState.value) {
      case StartWorkspaceState.create:
        await createWorkspace.trigger(nameEditingController.text);
      case StartWorkspaceState.join:
        await goNamed.trigger(GoName('invitation_info_for_use_start_workspace', pathParameters: {'code': codeEditingController.text}));
    }
  });
  return startWorkspace;
}

enum StartWorkspaceState { create, join }
