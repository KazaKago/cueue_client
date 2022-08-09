import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/domain/model/hierarchy/content/content.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/global/modal/simple_message_dialog.dart';
import 'package:cueue/presentation/view/global/modal/simple_message_dialog_event.dart';
import 'package:cueue/presentation/view/global/modal/text_field_dialog.dart';
import 'package:cueue/presentation/view/global/modal/text_field_dialog_event.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authentication_page.dart';
import 'package:cueue/presentation/view/hierarchy/photo/photo_pickup_bottom_sheet_dialog.dart';
import 'package:cueue/presentation/view/hierarchy/setting/settings_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_io/io.dart';

class MyPage extends HookConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(myPageViewModelProvider);
    ref
      ..listen<Event<void>>(myPageViewModelProvider.select((viewModel) => viewModel.replaceWelcomePageEvent), (previous, replaceWelcomePageEvent) {
        replaceWelcomePageEvent((_) => _replaceWelcomePage(context));
      })
      ..listen<Event<Exception>>(myPageViewModelProvider.select((viewModel) => viewModel.exceptionEvent), (previous, exceptionEvent) {
        exceptionEvent((exception) => _showErrorDialog(context, ref, exception));
      })
      ..listen<bool>(myPageViewModelProvider.select((viewModel) => viewModel.isLoading), (previous, isLoading) {
        isLoading ? EasyLoading.show() : EasyLoading.dismiss();
      });
    return Scaffold(
      appBar: AppBar(
        title: Text(intl(context).mypage),
        actions: [
          IconButton(
            onPressed: () => _goSettings(context),
            icon: const Icon(Icons.settings),
            tooltip: intl(context).settings,
          ),
          IconButton(
            onPressed: () => _showSignOutConfirmationDialog(context, ref),
            icon: const Icon(Icons.exit_to_app),
            tooltip: intl(context).logout,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: viewModel.refresh,
        child: Scrollbar(
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: <Widget>[
                  const SizedBox(height: 16),
                  _buildProfileImage(context, ref),
                  _buildNickNameTitle(context, ref),
                  _buildNickname(context, ref),
                  _buildWorkspaceTitle(context, ref),
                  _buildWorkspace(context, ref),
                  _buildWorkspaceMembersTitle(context, ref),
                ] +
                _buildWorkspaceMembers(context, ref) +
                [
                  const SizedBox(height: 16),
                ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myPageViewModelProvider.select((viewModel) => viewModel.state));
    return state.when(
      loading: () => const SizedBox(
        width: 196,
        height: 196,
        child: Center(child: CircularProgressIndicator()),
      ),
      completed: (state) => _buildImage(context, ref, state.photo),
      error: ErrorHandlingWidget.new,
    );
  }

  Widget _buildImage(BuildContext context, WidgetRef ref, Content? photo) {
    if (photo != null) {
      return Center(
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            GestureDetector(
              onTap: () => _pickupProfileImage(context, ref),
              child: SizedBox(
                width: 196,
                height: 196,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: CachedNetworkImageProvider(photo.url.toString()),
                ),
              ),
            ),
            FloatingActionButton.small(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () => _pickupProfileImage(context, ref),
              tooltip: intl(context).change_photo,
              heroTag: intl(context).change_photo,
              child: const Icon(Icons.edit),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            GestureDetector(
              onTap: () => _pickupProfileImage(context, ref),
              child: SizedBox(
                width: 196,
                height: 196,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).dividerColor,
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Assets.images.icAppIcon.image(color: Theme.of(context).hoverColor),
                  ),
                ),
              ),
            ),
            FloatingActionButton.small(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () => _pickupProfileImage(context, ref),
              tooltip: intl(context).change_photo,
              heroTag: intl(context).change_photo,
              child: const Icon(Icons.edit),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildNickNameTitle(BuildContext context, WidgetRef ref) {
    return ListTile(
      subtitle: Text(intl(context).displayName, style: Theme.of(context).textTheme.caption),
    );
  }

  Widget _buildNickname(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myPageViewModelProvider.select((viewModel) => viewModel.state));
    return state.when(
      loading: () => ListTile(
        leading: const Icon(Icons.account_circle_outlined),
        title: Text(intl(context).loading),
      ),
      completed: (user) => ListTile(
        leading: const Icon(Icons.account_circle_outlined),
        trailing: const Icon(Icons.edit),
        title: Text(user.displayName),
        onTap: () => _showDisplayNameInput(context, ref, user.displayName),
      ),
      error: (exception) => ListTile(
        leading: const Icon(Icons.account_circle_outlined),
        title: Text(intl(context).errorLoading),
      ),
    );
  }

  Widget _buildWorkspaceTitle(BuildContext context, WidgetRef ref) {
    return ListTile(
      subtitle: Text(intl(context).workspaceName, style: Theme.of(context).textTheme.caption),
    );
  }

  Widget _buildWorkspace(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myPageViewModelProvider.select((viewModel) => viewModel.state));
    return state.when(
      loading: () => ListTile(
        leading: const Icon(Icons.workspaces),
        title: Text(intl(context).loading),
      ),
      completed: (user) => ListTile(
        leading: const Icon(Icons.workspaces),
        trailing: const Icon(Icons.edit),
        title: Text(user.requireWorkspace().name),
        onTap: () => _showWorkspaceInput(context, ref, user.requireWorkspace().name),
      ),
      error: (exception) => ListTile(
        leading: const Icon(Icons.workspaces),
        title: Text(intl(context).errorLoading),
      ),
    );
  }

  Widget _buildWorkspaceMembersTitle(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myPageViewModelProvider.select((viewModel) => viewModel.state));
    return state.when(
      loading: () => ListTile(
        subtitle: Text(intl(context).joiningWorkspaceMember, style: Theme.of(context).textTheme.caption),
      ),
      completed: (user) => ListTile(
        subtitle: Text(intl(context).joiningWorkspaceMemberWithCount(user.requireWorkspace().users.length), style: Theme.of(context).textTheme.caption),
      ),
      error: (exception) => ListTile(
        subtitle: Text(intl(context).joiningWorkspaceMember, style: Theme.of(context).textTheme.caption),
      ),
    );
  }

  List<Widget> _buildWorkspaceMembers(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myPageViewModelProvider.select((viewModel) => viewModel.state));
    return state.when(
      loading: () => [
        ListTile(
          leading: const Icon(Icons.account_circle_outlined),
          title: Text(intl(context).loading),
        )
      ],
      completed: (user) => user.requireWorkspace().users.map(
        (user) {
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
              leading: const Icon(Icons.account_circle_outlined),
              title: Text(user.displayName),
            );
          }
        },
      ).toList(),
      error: (exception) => [
        ListTile(
          leading: const Icon(Icons.account_circle_outlined),
          title: Text(intl(context).errorLoading),
        )
      ],
    );
  }

  Future<void> _goSettings(BuildContext context) async {
    await Navigator.push<SettingsPage>(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
  }

  Future<void> _showSignOutConfirmationDialog(BuildContext context, WidgetRef ref) async {
    final event = await showDialog<SimpleMessageDialogEvent>(
      context: context,
      builder: (context) => SimpleMessageDialog(title: intl(context).confirm, message: intl(context).confirmLogout, positiveButton: intl(context).logout, negativeButton: intl(context).cancel),
    );
    if (event != null) {
      await event.when(
        positive: () async {
          final viewModel = ref.read(myPageViewModelProvider);
          await viewModel.signOut();
        },
        negative: () {},
        neutral: () {},
      );
    }
  }

  Future<void> _replaceWelcomePage(BuildContext context) {
    return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const AuthenticationPage()), (_) => false);
  }

  Future<void> _showErrorDialog(BuildContext context, WidgetRef ref, Exception exception) async {
    await const ExceptionHandler().showMessageDialog(context, ref, exception);
  }

  Future<void> _pickupProfileImage(BuildContext context, WidgetRef ref) async {
    final imagePicker = ImagePicker();
    final event = await PhotoPickupBottomSheetDialog(context).show();
    final pickedImage = await event?.when(
      fromCamera: () => imagePicker.pickImage(source: ImageSource.camera),
      fromLibrary: () => imagePicker.pickImage(source: ImageSource.gallery),
      cancel: () => null,
    );
    if (pickedImage != null) {
      final viewModel = ref.read(myPageViewModelProvider);
      await viewModel.updatePhoto(File(pickedImage.path));
    }
  }

  Future<void> _showDisplayNameInput(BuildContext context, WidgetRef ref, String displayName) async {
    final event = await showDialog<TextFieldDialogEvent>(
      context: context,
      builder: (context) => TextFieldDialog(
        title: intl(context).changeDisplayName,
        defaultText: displayName,
        keyboardType: TextInputType.name,
        positiveButton: intl(context).done,
        negativeButton: intl(context).cancel,
      ),
    );
    if (event != null) {
      await event.maybeWhen(
        positive: (currentText, originalText) async {
          final viewModel = ref.read(myPageViewModelProvider);
          await viewModel.updateDisplayName(currentText);
        },
        orElse: () {},
      );
    }
  }

  Future<void> _showWorkspaceInput(BuildContext context, WidgetRef ref, String workspaceName) async {
    final event = await showDialog<TextFieldDialogEvent>(
      context: context,
      builder: (context) => TextFieldDialog(
        title: intl(context).changeWorkspaceName,
        defaultText: workspaceName,
        keyboardType: TextInputType.name,
        positiveButton: intl(context).done,
        negativeButton: intl(context).cancel,
      ),
    );
    if (event != null) {
      await event.maybeWhen(
        positive: (currentText, originalText) async {
          final viewModel = ref.read(myPageViewModelProvider);
          await viewModel.updateWorkspaceName(currentText);
        },
        orElse: () {},
      );
    }
  }
}
