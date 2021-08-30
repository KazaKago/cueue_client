import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/domain/model/hierarchy/content/content.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/global/modal/simple_message_dialog.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/hierarchy/photo/photo_pickup_bottom_sheet_dialog.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/editing_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class RecipeEditingPage extends HookConsumerWidget {
  const RecipeEditingPage({this.recipe, final Key? key}) : super(key: key);

  final Recipe? recipe;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final images = useState(recipe?.images.toList() ?? []);
    final selectedTagIds = useState(recipe?.tags.map((e) => e.id).toList() ?? []);
    final recipeTitleEditingController = useTextEditingController(text: recipe?.title ?? '');
    final recipeUrlEditingController = useTextEditingController(text: recipe?.url?.toString() ?? '');
    final recipeDescriptionEditingController = useTextEditingController(text: recipe?.description ?? '');
    ref
      ..listen(recipeEditingViewModelProvider.select((viewModel) => viewModel.isLoading), ((final bool isLoading) {
        isLoading ? EasyLoading.show() : EasyLoading.dismiss();
      }))
      ..listen(recipeEditingViewModelProvider.select((viewModel) => viewModel.completion), ((final EditingResult? completion) {
        if (completion != null) Navigator.of(context).pop(completion);
        ref.read(recipeEditingViewModelProvider).completion = null;
      }))
      ..listen(recipeEditingViewModelProvider.select((viewModel) => viewModel.exception), ((final Exception? exception) {
        if (exception != null) const ExceptionHandler().showMessageDialog(context, ref, exception);
        ref.read(recipeEditingViewModelProvider).exception = null;
      }));
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe != null ? AppLocalizations.of(context)!.editWith(recipe!.title) : AppLocalizations.of(context)!.addRecipe),
        actions: [
          if (recipe != null)
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: AppLocalizations.of(context)!.doDelete,
              onPressed: () => _showConfirmationDeletingDialog(context, ref, recipe!),
            ),
        ],
      ),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
          children: <Widget>[
            _buildTitle(context, ref, recipeTitleEditingController),
            const SizedBox(height: 16),
            ..._buildImages(context, ref, images),
            ..._buildLoadingImage(context, ref),
            _buildImageAdding(context, ref, images),
            const SizedBox(height: 16),
            _buildUrl(context, ref, recipeUrlEditingController),
            const SizedBox(height: 24),
            _buildDescription(context, ref, recipeDescriptionEditingController),
            const SizedBox(height: 24),
            _buildTagChips(context, ref, selectedTagIds),
            const SizedBox(height: 24),
            _buildRegisterButton(context, ref, recipeTitleEditingController, recipeDescriptionEditingController, recipeUrlEditingController, images.value, selectedTagIds.value),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(final BuildContext context, final WidgetRef ref, final TextEditingController recipeTitleEditingController) {
    return TextField(
      controller: recipeTitleEditingController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: AppLocalizations.of(context)!.recipeName, alignLabelWithHint: true, border: const OutlineInputBorder()),
    );
  }

  List<Widget> _buildLoadingImage(final BuildContext context, final WidgetRef ref) {
    final widgetList = <Widget>[];
    final isCreatingImage = ref.watch(recipeEditingViewModelProvider.select((viewModel) => viewModel.isCreatingImage));
    if (isCreatingImage) {
      widgetList
        ..add(Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.passthrough,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: Theme.of(context).dividerColor,
                      width: 96,
                      height: 96,
                    ),
                  ),
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Text(AppLocalizations.of(context)!.uploading, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Theme.of(context).textTheme.caption?.color)),
          ],
        ))
        ..add(const SizedBox(height: 8));
    }
    return widgetList;
  }

  List<Widget> _buildImages(final BuildContext context, final WidgetRef ref, final ValueNotifier<List<Content>> images) {
    final widgetList = <Widget>[];
    images.value.asMap().forEach((index, image) {
      widgetList
        ..add(Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: image.url.toString(),
                  fit: BoxFit.cover,
                  width: 96,
                  height: 96,
                  fadeInDuration: const Duration(milliseconds: 300),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: [
                    TextButton.icon(onPressed: (0 < index) ? () => _upImage(image, images) : null, icon: const Icon(Icons.keyboard_arrow_up), label: Text(AppLocalizations.of(context)!.toUp)),
                    TextButton.icon(onPressed: (index < (images.value.length - 1)) ? () => _downImage(image, images) : null, icon: const Icon(Icons.keyboard_arrow_down), label: Text(AppLocalizations.of(context)!.toDown)),
                  ]),
                  const SizedBox(width: 32),
                  TextButton.icon(onPressed: () => _deleteImage(image, images), icon: const Icon(Icons.clear), label: Text(AppLocalizations.of(context)!.delete)),
                ],
              ),
            ),
          ],
        ))
        ..add(const SizedBox(height: 8));
    });
    return widgetList;
  }

  Widget _buildImageAdding(final BuildContext context, final WidgetRef ref, final ValueNotifier<List<Content>> images) {
    return InkWell(
      onTap: () => _pickupProfileImage(context, ref, images),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.passthrough,
                children: [
                  Container(color: Theme.of(context).dividerColor, width: 96, height: 96),
                  Icon(Icons.add, size: 48, color: Theme.of(context).scaffoldBackgroundColor),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(AppLocalizations.of(context)!.addRecipeImage, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Theme.of(context).colorScheme.primary)),
        ],
      ),
    );
  }

  Widget _buildUrl(final BuildContext context, final WidgetRef ref, final TextEditingController recipeUrlEditingController) {
    return TextField(
      controller: recipeUrlEditingController,
      keyboardType: TextInputType.url,
      decoration: InputDecoration(labelText: AppLocalizations.of(context)!.referenceLink, alignLabelWithHint: true, border: const OutlineInputBorder()),
    );
  }

  Widget _buildDescription(final BuildContext context, final WidgetRef ref, final TextEditingController recipeDescriptionEditingController) {
    return TextField(
      controller: recipeDescriptionEditingController,
      keyboardType: TextInputType.multiline,
      minLines: 8,
      maxLines: null,
      decoration: InputDecoration(labelText: AppLocalizations.of(context)!.description, alignLabelWithHint: true, border: const OutlineInputBorder()),
    );
  }

  Widget _buildTagChips(final BuildContext context, final WidgetRef ref, final ValueNotifier<List<TagId>> selectedTagIds) {
    final state = ref.watch(recipeEditingViewModelProvider.select((viewModel) => viewModel.state));
    return state.when(
      loading: () => _buildTagChipsLoading(context, ref),
      completed: (tags) => _buildTagChipsCompleted(context, ref, tags, selectedTagIds),
      error: (exception) => _buildTagChipsError(context, ref, exception),
    );
  }

  Widget _buildTagChipsLoading(final BuildContext context, final WidgetRef ref) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildTagChipsCompleted(final BuildContext context, final WidgetRef ref, final List<Tag> tags, final ValueNotifier<List<TagId>> selectedTagIds) {
    return Wrap(
      spacing: 12,
      children: tags.map((e) {
        return FilterChip(
          label: Text(e.name),
          selected: selectedTagIds.value.contains(e.id),
          onSelected: (bool value) {
            if (value) {
              selectedTagIds.value = List.from(selectedTagIds.value..add(e.id));
            } else {
              selectedTagIds.value = List.from(selectedTagIds.value..remove(e.id));
            }
          },
        );
      }).toList(),
    );
  }

  Widget _buildTagChipsError(final BuildContext context, final WidgetRef ref, final Exception exception) {
    final viewModel = ref.read(recipeEditingViewModelProvider);
    return ErrorHandlingWidget(exception, onClickRetry: viewModel.retry);
  }

  Widget _buildRegisterButton(final BuildContext context, final WidgetRef ref, final TextEditingController recipeTitleEditingController, final TextEditingController recipeDescriptionEditingController, final TextEditingController recipeUrlEditingController, final List<Content> images, final List<TagId> selectedTagIds) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.save),
        label: Text(recipe != null ? AppLocalizations.of(context)!.doFix : AppLocalizations.of(context)!.doAdd),
        onPressed: () {
          final viewModel = ref.read(recipeEditingViewModelProvider);
          if (recipe != null) {
            viewModel.updateRecipe(recipe!.id, recipeTitleEditingController.text, recipeDescriptionEditingController.text, recipeUrlEditingController.text, images, selectedTagIds);
          } else {
            viewModel.createRecipe(recipeTitleEditingController.text, recipeDescriptionEditingController.text, recipeUrlEditingController.text, images, selectedTagIds);
          }
        },
      ),
    );
  }

  Future<void> _showConfirmationDeletingDialog(final BuildContext context, final WidgetRef ref, final Recipe recipe) async {
    final event = await SimpleMessageDialog(context, title: AppLocalizations.of(context)!.confirm, message: AppLocalizations.of(context)!.confirmDeletingWith(recipe.title), positiveButton: AppLocalizations.of(context)!.doDelete, negativeButton: AppLocalizations.of(context)!.cancel).show();
    if (event != null) {
      await event.when(
        positive: () async {
          final viewModel = ref.read(recipeEditingViewModelProvider);
          await viewModel.deleteRecipe(recipe.id);
        },
        neutral: () {},
        negative: () {},
      );
    }
  }

  Future<Content?> _pickupProfileImage(final BuildContext context, final WidgetRef ref, final ValueNotifier<List<Content>> images) async {
    final imagePicker = ImagePicker();
    final event = await PhotoPickupBottomSheetDialog(context).show();
    final pickedImage = await event?.when(
      fromCamera: () => imagePicker.pickImage(source: ImageSource.camera),
      fromLibrary: () => imagePicker.pickImage(source: ImageSource.gallery),
      cancel: () => null,
    );
    if (pickedImage != null) {
      final viewModel = ref.read(recipeEditingViewModelProvider);
      final image = await viewModel.createImage(File(pickedImage.path));
      if (image != null) images.value = List.from(images.value..add(image));
    }
  }

  Future<void> _deleteImage(final Content image, final ValueNotifier<List<Content>> images) async {
    images.value = List.from(images.value..remove(image));
  }

  Future<void> _upImage(final Content image, final ValueNotifier<List<Content>> images) async {
    final originalIndex = images.value.indexOf(image);
    if (originalIndex <= 0) return;
    images.value = List.from(images.value
      ..removeAt(originalIndex)
      ..insert(originalIndex - 1, image));
  }

  Future<void> _downImage(final Content image, final ValueNotifier<List<Content>> images) async {
    final originalIndex = images.value.indexOf(image);
    if (originalIndex < 0 || (images.value.length - 2) < originalIndex) return;
    images.value = List.from(images.value
      ..removeAt(originalIndex)
      ..insert(originalIndex + 1, image));
  }
}
