import 'package:cueue/domain/model/hierarchy/invitation/invitation_code.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/hierarchy/invitation/invitation_info_page.dart';
import 'package:cueue/presentation/view/hierarchy/main/main_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkspaceCreationPage extends ConsumerWidget {
  const WorkspaceCreationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(workspaceCreationViewModelProvider);
    ref
      ..listen<bool>(workspaceCreationViewModelProvider.select((viewModel) => viewModel.isLoading), (previous, isLoading) {
        isLoading ? EasyLoading.show() : EasyLoading.dismiss();
      })
      ..listen<Event<void>>(workspaceCreationViewModelProvider.select((viewModel) => viewModel.completionEvent), (previous, event) {
        event.call((_) => _replaceMainPage(context));
      })
      ..listen<Event<Exception>>(workspaceCreationViewModelProvider.select((viewModel) => viewModel.exceptionEvent), (previous, event) {
        event((exception) => const ExceptionHandler().showMessageDialog(context, ref, exception));
      });
    return _WorkspaceCreationPage(
      onClickSubmit: (selectionState, code) {
        switch (selectionState) {
          case _SelectionState.create:
            viewModel.createWorkspace();
            break;
          case _SelectionState.join:
            _pushInvitationInfo(context, code);
            break;
        }
      },
    );
  }

  Future<void> _replaceMainPage(BuildContext context) async {
    await Navigator.pushAndRemoveUntil<void>(context, MaterialPageRoute(builder: (context) => const MainPage()), (route) => false);
  }

  Future<void> _pushInvitationInfo(BuildContext context, String code) async {
    final invitationCode = InvitationCode(code);
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => InvitationInfoPage(invitationCode)));
  }
}

class _WorkspaceCreationPage extends HookWidget {
  const _WorkspaceCreationPage({required this.onClickSubmit});

  final void Function(_SelectionState selectionState, String code) onClickSubmit;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final codeEditingController = useTextEditingController();
    final code = useState('');
    final selectedState = useState(_SelectionState.create);
    codeEditingController.addListener(() {
      code.value = codeEditingController.text;
    });
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
                const SizedBox(height: 8),
                _buildJoinWorkspaceRadioButton(selectedState),
                if (selectedState.value == _SelectionState.join) _buildInputInvitationCode(codeEditingController),
                const SizedBox(height: 48),
                _buildSubmitButton(selectedState.value, code.value, () => onClickSubmit(selectedState.value, code.value)),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(intl(useContext()).welcomeToCueue, textAlign: TextAlign.center, style: Theme.of(useContext()).textTheme.headline3),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(intl(useContext()).createWorkSpaceOrJoinFamilyWorkspace, textAlign: TextAlign.center, style: Theme.of(useContext()).textTheme.titleMedium),
    );
  }

  Widget _buildCreateWorkspaceRadioButton(ValueNotifier<_SelectionState> selectedState) {
    return RadioListTile(
      title: Text(intl(useContext()).createNewWorkspace),
      value: _SelectionState.create,
      groupValue: selectedState.value,
      onChanged: (_SelectionState? value) {
        if (value != null) selectedState.value = value;
      },
    );
  }

  Widget _buildJoinWorkspaceRadioButton(ValueNotifier<_SelectionState> selectedState) {
    return RadioListTile(
      title: Text(intl(useContext()).joinInvitedWorkspace),
      value: _SelectionState.join,
      groupValue: selectedState.value,
      onChanged: (_SelectionState? value) {
        if (value != null) selectedState.value = value;
      },
    );
  }

  Widget _buildInputInvitationCode(TextEditingController codeEditingController) {
    return Padding(
      padding: const EdgeInsets.only(left: 72, right: 32),
      child: TextField(
        controller: codeEditingController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: intl(useContext()).inputInvitationCode),
      ),
    );
  }

  Widget _buildSubmitButton(_SelectionState selectedState, String code, void Function() onClick) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ElevatedButton(
        onPressed: (selectedState == _SelectionState.join && code.isEmpty) ? null : onClick,
        child: Text(intl(useContext()).letsStart),
      ),
    );
  }

  Widget _buildYouCanChangeAfter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(intl(useContext()).youCanJoinAnotherWorkspaceAfter, textAlign: TextAlign.center),
    );
  }
}

enum _SelectionState { create, join }
