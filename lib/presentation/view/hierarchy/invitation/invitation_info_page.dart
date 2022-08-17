import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/domain/model/hierarchy/invitation/invitation.dart';
import 'package:cueue/domain/model/hierarchy/invitation/invitation_code.dart';
import 'package:cueue/domain/model/hierarchy/user/user_summary.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/global/modal/simple_message_dialog.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/hierarchy/splash/splash_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InvitationInfoPage extends HookConsumerWidget {
  const InvitationInfoPage(this.code, {super.key});

  final InvitationCode code;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(invitationInfoViewModelProvider(code).select((viewModel) => viewModel.state));
    ref
      ..listen<bool>(invitationInfoViewModelProvider(code).select((viewModel) => viewModel.isLoading), (previous, isLoading) {
        isLoading ? EasyLoading.show() : EasyLoading.dismiss();
      })
      ..listen<Event<void>>(invitationInfoViewModelProvider(code).select((viewModel) => viewModel.completionEvent), (previous, event) {
        event.call((_) => _replaceSplashPage(context));
      })
      ..listen<Event<Exception>>(invitationInfoViewModelProvider(code).select((viewModel) => viewModel.exceptionEvent), (previous, event) {
        event((exception) => const ExceptionHandler().showMessageDialog(context, ref, exception));
      });
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
    final viewModel = ref.read(invitationInfoViewModelProvider(code));
    final scrollController = useScrollController();
    return Scrollbar(
      controller: scrollController,
      child: ListView(
        controller: scrollController,
        padding: const EdgeInsets.all(32),
        children: [
          SelectableText(textAlign: TextAlign.center, intl(context).confirmJoinFollowingWorkspace),
          ListTile(subtitle: SelectableText(intl(context).workspaceName, style: Theme.of(context).textTheme.caption)),
          ListTile(title: SelectableText(invitation.workspace.name)),
          ListTile(subtitle: SelectableText(intl(context).memberOfWorkspace, style: Theme.of(context).textTheme.caption)),
          for (final user in invitation.workspace.users) _buildWorkspaceMember(context, ref, user),
          const SizedBox(height: 32),
          SelectableText(textAlign: TextAlign.center, intl(context).warningJoiningWorkspace),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: viewModel.acceptInvitation,
            child: Text(intl(context).joinWorkspace),
          ),
        ],
      ),
    );
  }

  Widget _buildError(BuildContext context, WidgetRef ref, Exception exception) {
    return ErrorHandlingWidget(exception);
  }

  Widget _buildWorkspaceMember(BuildContext context, WidgetRef ref, UserSummary user) {
    if (user.photo != null) {
      return ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: CachedNetworkImageProvider(user.photo!.url.toString()),
        ),
        title: Text(user.displayName),
      );
    } else {
      return ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).dividerColor,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Assets.images.icAppIcon.image(color: Theme.of(context).hoverColor),
          ),
        ),
        title: Text(user.displayName),
      );
    }
  }

  Future<void> _replaceSplashPage(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (context) => SimpleMessageDialog(title: intl(context).info, message: intl(context).successToJoinWorkspace, positiveButton: intl(context).confirm),
    );
    await Navigator.pushAndRemoveUntil<void>(context, MaterialPageRoute(builder: (context) => const SplashPage()), (route) => false);
  }
}
