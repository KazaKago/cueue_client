import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/domain/model/hierarchy/content/content.dart';
import 'package:cueue/domain/model/hierarchy/content/content_key.dart';
import 'package:cueue/domain/model/hierarchy/user/pre_user.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/global/widget/loading_widget.dart';
import 'package:cueue/presentation/view/hierarchy/photo/photo_pickup_bottom_sheet_dialog.dart';
import 'package:cueue/presentation/view/hierarchy/photo/photo_pickup_bottom_sheet_event.dart';
import 'package:cueue/presentation/view/hierarchy/welcome/workspace_creation_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:cueue/presentation/viewmodel/global/ui_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_io/io.dart';

class UserCreationPage extends ConsumerWidget {
  const UserCreationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
      ..listen<Event<Exception>>(userCreationViewModelProvider.select((viewModel) => viewModel.exceptionEvent), (previous, exceptionEvent) {
        exceptionEvent((exception) => _showErrorDialog(context, ref, exception));
      })
      ..listen<bool>(userCreationViewModelProvider.select((viewModel) => viewModel.isLoading), (previous, isLoading) {
        isLoading ? EasyLoading.show() : EasyLoading.dismiss();
      })
      ..listen<void>(userCreationViewModelProvider.select((viewModel) => viewModel.completionEvent), (previous, next) {
        _replaceWorkspaceCreationPage(context);
      });
    final viewModel = ref.read(userCreationViewModelProvider);
    final uiState = ref.watch(userCreationViewModelProvider.select((viewModel) => viewModel.uiState));
    return _UserCreationPage(
      uiState: uiState,
      onClickImage: () => _pickupProfileImage(context, viewModel.updatePhoto),
      onClickSubmit: viewModel.createUser,
    );
  }

  Future<void> _showErrorDialog(BuildContext context, WidgetRef ref, Exception exception) async {
    await const ExceptionHandler().showMessageDialog(context, ref, exception);
  }

  Future<void> _pickupProfileImage(BuildContext context, void Function(File pickedImage) onPickImage) async {
    final imagePicker = ImagePicker();
    final event = await showModalBottomSheet<PhotoPickupBottomSheetEvent>(
      context: context,
      builder: PhotoPickupBottomSheetDialog.new,
    );
    final pickedImage = await event?.when(
      fromCamera: () => imagePicker.pickImage(source: ImageSource.camera),
      fromLibrary: () => imagePicker.pickImage(source: ImageSource.gallery),
      cancel: () => null,
    );
    if (pickedImage != null) {
      onPickImage(File(pickedImage.path));
    }
  }

  Future<void> _replaceWorkspaceCreationPage(BuildContext context) async {
    await Navigator.pushAndRemoveUntil<void>(context, MaterialPageRoute(builder: (context) => const WorkspaceCreationPage()), (route) => false);
  }
}

class _UserCreationPage extends HookWidget {
  const _UserCreationPage({required this.uiState, required this.onClickImage, required this.onClickSubmit});

  final UiState<PreUser> uiState;
  final void Function() onClickImage;
  final void Function(String displayName, ContentKey? photoKey) onClickSubmit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: uiState.when(
          loading: (_) => const LoadingWidget(),
          completed: _buildCompleted,
          error: (_, exception) => ErrorHandlingWidget(exception),
        ),
      ),
    );
  }

  Widget _buildCompleted(PreUser preUser) {
    final scrollController = useScrollController();
    final displayNameEditingController = useTextEditingController(text: preUser.displayName);
    return Scrollbar(
      controller: scrollController,
      child: ListView(
        padding: const EdgeInsets.all(32),
        controller: scrollController,
        children: <Widget>[
          Text(intl(useContext()).welcomeToCueue, textAlign: TextAlign.center, style: Theme.of(useContext()).textTheme.headline3),
          const SizedBox(height: 8),
          Text(intl(useContext()).pleaseTellMeAboutYour, textAlign: TextAlign.center, style: Theme.of(useContext()).textTheme.titleMedium),
          const SizedBox(height: 48),
          _buildProfileImage(preUser.photo),
          const SizedBox(height: 48),
          _buildNickname(displayNameEditingController),
          const SizedBox(height: 48),
          _buildSubmitButton(() => onClickSubmit(displayNameEditingController.text, preUser.photo?.key)),
          const SizedBox(height: 8),
          _buildYouCanChangeAfter(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildProfileImage(Content? photo) {
    if (photo != null) {
      return Center(
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            GestureDetector(
              onTap: onClickImage,
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
              onPressed: onClickImage,
              tooltip: intl(useContext()).changePhoto,
              heroTag: intl(useContext()).changePhoto,
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
              onTap: onClickImage,
              child: SizedBox(
                width: 196,
                height: 196,
                child: CircleAvatar(
                  backgroundColor: Theme.of(useContext()).dividerColor,
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Assets.images.icAppIcon.image(color: Theme.of(useContext()).hoverColor),
                  ),
                ),
              ),
            ),
            FloatingActionButton.small(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: onClickImage,
              tooltip: intl(useContext()).changePhoto,
              heroTag: intl(useContext()).changePhoto,
              child: const Icon(Icons.edit),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildNickname(TextEditingController displayNameEditingController) {
    return TextField(
      controller: displayNameEditingController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(labelText: intl(useContext()).displayName, alignLabelWithHint: true, border: const OutlineInputBorder()),
    );
  }

  Widget _buildSubmitButton(void Function() onClick) {
    return ElevatedButton(
      onPressed: onClick,
      child: Text(intl(useContext()).toNext),
    );
  }

  Widget _buildYouCanChangeAfter() {
    return Text(textAlign: TextAlign.center, intl(useContext()).youCanChangeAfter);
  }
}
