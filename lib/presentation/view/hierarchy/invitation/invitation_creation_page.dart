import 'package:cueue/domain/model/hierarchy/invitation/invitation.dart';
import 'package:cueue/domain/model/hierarchy/invitation/invitation_code.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/modal/fried_toast.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class InvitationCreationPage extends HookConsumerWidget {
  const InvitationCreationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(invitationCreationViewModelProvider.select((viewModel) => viewModel.state));
    return Scaffold(
      appBar: AppBar(title: Text(intl(context).workspaceInfo)),
      body: state.when(
        loading: () => _buildLoading(context, ref),
        completed: (invitation) => _buildCompleted(context, ref, invitation),
        error: (exception) => _buildError(context, ref, exception),
      ),
    );
  }

  Widget _buildLoading(BuildContext context, WidgetRef ref) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildCompleted(BuildContext context, WidgetRef ref, Invitation invitation) {
    final scrollController = useScrollController();
    return Scrollbar(
      controller: scrollController,
      child: ListView(
        controller: scrollController,
        padding: const EdgeInsets.all(32),
        children: [
          SelectableText(textAlign: TextAlign.center, intl(context).invitationCodePublishedTitle),
          const SizedBox(height: 16),
          ListTile(title: SelectableText(invitation.code.value, textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayLarge)),
          Center(child: TextButton.icon(icon: const Icon(Icons.copy), onPressed: () => copyInvitationCode(context, invitation.code), label: Text(intl(context).copyInvitationCode))),
          const SizedBox(height: 32),
          SelectableText(textAlign: TextAlign.center, intl(context).invitationCodePublishedMessage),
          const SizedBox(height: 32),
          OutlinedButton.icon(icon: const Icon(Icons.share), onPressed: () => shareInvitationMessage(context, invitation), label: Text(intl(context).shareInvitationCode)),
        ],
      ),
    );
  }

  Widget _buildError(BuildContext context, WidgetRef ref, Exception exception) {
    return ErrorHandlingWidget(exception);
  }

  Future<void> copyInvitationCode(BuildContext context, InvitationCode code) async {
    final data = ClipboardData(text: code.value);
    await Clipboard.setData(data);
    FriedToast(context, intl(context).copiedInvitationCode).show();
  }

  Future<void> shareInvitationMessage(BuildContext context, Invitation invitation) async {
    await Share.share(intl(context).invitationCodeSharingMessage(invitation.workspace.name, invitation.code.value, dotenv.get('LP_BASE_URL')));
  }
}
