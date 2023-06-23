import 'package:cueue/hooks/global/swr/swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_user.dart';
import 'package:cueue/hooks/hierarchy/welcome/use_start_workspace.dart';
import 'package:cueue/hooks/hierarchy/welcome/use_workspace_name_editing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkspaceCreationPage extends HookConsumerWidget {
  const WorkspaceCreationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = useUser(ref);
    final selectedState = useState(StartWorkspaceState.create);
    final scrollController = useScrollController();
    final nameEditingController = useWorkspaceNameEditingController(userState);
    final codeEditingController = useTextEditingController();
    final startWorkspace = useStartWorkspace(ref, selectedState, nameEditingController, codeEditingController);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Center(
          child: Scrollbar(
            controller: scrollController,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 32),
              controller: scrollController,
              children: [
                _buildTitle(),
                const SizedBox(height: 8),
                _buildDescription(),
                const SizedBox(height: 32),
                _buildCreateWorkspaceRadioButton(selectedState),
                if (selectedState.value == StartWorkspaceState.create) _buildInputWorkspaceName(nameEditingController),
                const SizedBox(height: 8),
                _buildJoinWorkspaceRadioButton(selectedState),
                if (selectedState.value == StartWorkspaceState.join) _buildInputInvitationCode(codeEditingController),
                const SizedBox(height: 48),
                _buildSubmitButton(ref, selectedState.value, codeEditingController, startWorkspace.trigger),
                const SizedBox(height: 8),
                _buildYouCanChangeAfter(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    final intl = useIntl();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(intl.welcomeToCueue, textAlign: TextAlign.center, style: Theme.of(useContext()).textTheme.displaySmall),
    );
  }

  Widget _buildDescription() {
    final intl = useIntl();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(intl.createWorkSpaceOrJoinFamilyWorkspace, textAlign: TextAlign.center, style: Theme.of(useContext()).textTheme.titleMedium),
    );
  }

  Widget _buildCreateWorkspaceRadioButton(ValueNotifier<StartWorkspaceState> selectedState) {
    final intl = useIntl();
    return RadioListTile(
      title: Text(intl.createNewWorkspace),
      value: StartWorkspaceState.create,
      groupValue: selectedState.value,
      onChanged: (StartWorkspaceState? value) {
        if (value != null) selectedState.value = value;
      },
    );
  }

  Widget _buildJoinWorkspaceRadioButton(ValueNotifier<StartWorkspaceState> selectedState) {
    final intl = useIntl();
    return RadioListTile(
      title: Text(intl.joinInvitedWorkspace),
      value: StartWorkspaceState.join,
      groupValue: selectedState.value,
      onChanged: (StartWorkspaceState? value) {
        if (value != null) selectedState.value = value;
      },
    );
  }

  Widget _buildInputWorkspaceName(TextEditingController nameEditingController) {
    final intl = useIntl();
    return Padding(
      padding: const EdgeInsets.only(left: 72, right: 32),
      child: TextField(
        controller: nameEditingController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(labelText: intl.inputWorkspaceName),
      ),
    );
  }

  Widget _buildInputInvitationCode(TextEditingController codeEditingController) {
    final intl = useIntl();
    return Padding(
      padding: const EdgeInsets.only(left: 72, right: 32),
      child: TextField(
        controller: codeEditingController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: intl.inputInvitationCode),
      ),
    );
  }

  Widget _buildSubmitButton(
    WidgetRef ref,
    StartWorkspaceState selectionState,
    TextEditingController codeEditingController,
    SWRTrigger<void, void> startWorkspace,
  ) {
    final intl = useIntl();
    final isEnableSubmitButton = useState(false);
    codeEditingController.addListener(() {
      isEnableSubmitButton.value = codeEditingController.text.isNotEmpty;
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ElevatedButton(
        onPressed: (selectionState == StartWorkspaceState.join && !isEnableSubmitButton.value) ? null : () => startWorkspace(null),
        child: Text(intl.letsStart),
      ),
    );
  }

  Widget _buildYouCanChangeAfter() {
    final intl = useIntl();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(intl.youCanJoinAnotherWorkspaceAfter, textAlign: TextAlign.center),
    );
  }
}
