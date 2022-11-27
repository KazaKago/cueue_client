import 'package:cueue/domain/model/hierarchy/invitation/invitation.dart';
import 'package:cueue/domain/model/hierarchy/invitation/invitation_code.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/extension/date_time_extension.dart';
import 'package:cueue/presentation/view/global/modal/fried_toast.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/invitation/invitation_creation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class InvitationCreationPage extends ConsumerWidget {
  const InvitationCreationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(invitationCreationViewModelProvider.select((viewModel) => viewModel.state));
    return _InvitationCreationPage(
      state: state,
      onClickCopy: (code) => copyInvitationCode(context, code),
      onClickShare: (invitation) => shareInvitationMessage(context, invitation),
    );
  }

  Future<void> copyInvitationCode(BuildContext context, InvitationCode code) async {
    final data = ClipboardData(text: code.value);
    await Clipboard.setData(data);
    FriedToast(context, intl(context).copiedInvitationCode).show();
  }

  Future<void> shareInvitationMessage(BuildContext context, Invitation invitation) async {
    await Share.share(intl(context).invitationCodeSharingMessage(invitation.workspace.name, invitation.code.value, invitation.expiredAt.toDateTimeString(context), dotenv.get('LP_BASE_URL')));
  }
}

class _InvitationCreationPage extends HookWidget {
  const _InvitationCreationPage({required this.state, required this.onClickCopy, required this.onClickShare});

  final InvitationCreationState state;
  final void Function(InvitationCode code) onClickCopy;
  final void Function(Invitation invitation) onClickShare;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl(context).invitationCode)),
      body: state.when(
        loading: _buildLoading,
        completed: _buildCompleted,
        error: _buildError,
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildCompleted(Invitation invitation) {
    final scrollController = useScrollController();
    return Scrollbar(
      controller: scrollController,
      child: ListView(
        controller: scrollController,
        padding: const EdgeInsets.all(32),
        children: [
          Text(textAlign: TextAlign.center, intl(useContext()).invitationCodePublishedTitle),
          const SizedBox(height: 16),
          ListTile(title: SelectableText(invitation.code.value, textAlign: TextAlign.center, style: Theme.of(useContext()).textTheme.displayLarge)),
          Center(child: TextButton.icon(icon: const Icon(Icons.copy), onPressed: () => onClickCopy(invitation.code), label: Text(intl(useContext()).copyInvitationCode))),
          const SizedBox(height: 32),
          Text(textAlign: TextAlign.center, intl(useContext()).invitationCodePublishedMessage),
          const SizedBox(height: 32),
          OutlinedButton.icon(icon: const Icon(Icons.share), onPressed: () => onClickShare(invitation), label: Text(intl(useContext()).shareInvitationCode)),
        ],
      ),
    );
  }

  Widget _buildError(Exception exception) {
    return ErrorHandlingWidget(exception);
  }
}
