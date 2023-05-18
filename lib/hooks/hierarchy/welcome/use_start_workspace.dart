import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/hierarchy/welcome/use_create_workspace.dart';
import 'package:cueue/model/invitation/invitation_code.dart';
import 'package:cueue/ui/hierarchy/invitation/invitation_info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<void, void> useStartWorkspace(
  WidgetRef ref,
  ValueNotifier<StartWorkspaceState> selectionState,
  TextEditingController nameEditingController,
  TextEditingController codeEditingController,
) {
  final createWorkspace = useCreateWorkspace(ref);
  final pushPage = usePushPage<void>();
  final startWorkspace = useSWRTrigger<void, void>((name) async {
    switch (selectionState.value) {
      case StartWorkspaceState.create:
        await createWorkspace.trigger(nameEditingController.text);
      case StartWorkspaceState.join:
        await pushPage.trigger(InvitationInfoPage(InvitationCode(codeEditingController.text)));
    }
  });
  return startWorkspace;
}

enum StartWorkspaceState { create, join }
