import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/domain/model/hierarchy/content/content.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/global/modal/simple_message_dialog.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/hierarchy/photo/photo_pickup_bottom_sheet_dialog.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/editing_result.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class RecipeEditingPage extends HookConsumerWidget {
  const RecipeEditingPage({this.recipe, Key? key}) : super(key: key);

  final Recipe? recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = useState(recipe?.images.toList() ?? []);
    final selectedTagIds = useState(recipe?.tags.map((e) => e.id).toList() ?? []);
    final recipeTitleEditingController = useTextEditingController(text: recipe?.title ?? '');
    final recipeUrlEditingController = useTextEditingController(text: recipe?.url?.toString() ?? '');
    final recipeDescriptionEditingController = useTextEditingController(text: recipe?.description ?? '');
    ref
      ..listen<bool>(recipeEditingViewModelProvider.select((viewModel) => viewModel.isLoading), (previous, isLoading) {
        isLoading ? EasyLoading.show() : EasyLoading.dismiss();
      })
      ..listen<Event<EditingResult>>(recipeEditingViewModelProvider.select((viewModel) => viewModel.completionEvent), (previous, completionEvent) {
        completionEvent((completion) => Navigator.of(context).pop(completion));
      })
      ..listen<Event<Exception>>(recipeEditingViewModelProvider.select((viewModel) => viewModel.exceptionEvent), (previous, exceptionEvent) {
        exceptionEvent((exception) => const ExceptionHandler().showMessageDialog(context, ref, exception));
      });
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe != null ? intl(context).editWith(recipe!.title) : intl(context).addRecipe),
        actions: [
          if (recipe != null)
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: intl(context).doDelete,
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

  Widget _buildTitle(BuildContext context, WidgetRef ref, TextEditingController recipeTitleEditingController) {
    return TextField(
      controller: recipeTitleEditingController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: intl(context).recipeName, alignLabelWithHint: true, border: const OutlineInputBorder()),
    );
  }

  List<Widget> _buildLoadingImage(BuildContext context, WidgetRef ref) {
    final widgetList = <Widget>[];
    final isCreatingImage = ref.watch(recipeEditingViewModelProvider.select((viewModel) => viewModel.isCreatingImage));
    if (isCreatingImage) {
      widgetList
        ..add(
          Row(
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
              Text(intl(context).uploading, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Theme.of(context).textTheme.caption?.color)),
            ],
          ),
        )
        ..add(const SizedBox(height: 8));
    }
    return widgetList;
  }

  List<Widget> _buildImages(BuildContext context, WidgetRef ref, ValueNotifier<List<Content>> images) {
    final widgetList = <Widget>[];
    images.value.asMap().forEach((index, image) {
      widgetList
        ..add(
          Row(
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
                    Column(
                      children: [
                        TextButton.icon(onPressed: (0 < index) ? () => _upImage(image, images) : null, icon: const Icon(Icons.keyboard_arrow_up), label: Text(intl(context).toUp)),
                        TextButton.icon(onPressed: (index < (images.value.length - 1)) ? () => _downImage(image, images) : null, icon: const Icon(Icons.keyboard_arrow_down), label: Text(intl(context).toDown)),
                      ],
                    ),
                    const SizedBox(width: 32),
                    TextButton.icon(onPressed: () => _deleteImage(image, images), icon: const Icon(Icons.clear), label: Text(intl(context).delete)),
                  ],
                ),
              ),
            ],
          ),
        )
        ..add(const SizedBox(height: 8));
    });
    return widgetList;
  }

  Widget _buildImageAdding(BuildContext context, WidgetRef ref, ValueNotifier<List<Content>> images) {
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
          Text(intl(context).addRecipeImage, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Theme.of(context).colorScheme.primary)),
        ],
      ),
    );
  }

  Widget _buildUrl(BuildContext context, WidgetRef ref, TextEditingController recipeUrlEditingController) {
    return TextField(
      controller: recipeUrlEditingController,
      keyboardType: TextInputType.url,
      decoration: InputDecoration(labelText: intl(context).referenceLink, alignLabelWithHint: true, border: const OutlineInputBorder()),
    );
  }

  Widget _buildDescription(BuildContext context, WidgetRef ref, TextEditingController recipeDescriptionEditingController) {
    return TextField(
      controller: recipeDescriptionEditingController,
      keyboardType: TextInputType.multiline,
      minLines: 8,
      maxLines: null,
      decoration: InputDecoration(labelText: intl(context).description, alignLabelWithHint: true, border: const OutlineInputBorder()),
    );
  }

  Widget _buildTagChips(BuildContext context, WidgetRef ref, ValueNotifier<List<TagId>> selectedTagIds) {
    final state = ref.watch(recipeEditingViewModelProvider.select((viewModel) => viewModel.state));
    return state.when(
      loading: () => _buildTagChipsLoading(context, ref),
      completed: (tags) => _buildTagChipsCompleted(context, ref, tags, selectedTagIds),
      error: (exception) => _buildTagChipsError(context, ref, exception),
    );
  }

  Widget _buildTagChipsLoading(BuildContext context, WidgetRef ref) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildTagChipsCompleted(BuildContext context, WidgetRef ref, List<Tag> tags, ValueNotifier<List<TagId>> selectedTagIds) {
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

  Widget _buildTagChipsError(BuildContext context, WidgetRef ref, Exception exception) {
    final viewModel = ref.read(recipeEditingViewModelProvider);
    return ErrorHandlingWidget(exception, onClickRetry: viewModel.retry);
  }

  Widget _buildRegisterButton(BuildContext context, WidgetRef ref, TextEditingController recipeTitleEditingController, TextEditingController recipeDescriptionEditingController, TextEditingController recipeUrlEditingController, List<Content> images, List<TagId> selectedTagIds) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.save),
        label: Text(recipe != null ? intl(context).doFix : intl(context).doAdd),
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

  Future<void> _showConfirmationDeletingDialog(BuildContext context, WidgetRef ref, Recipe recipe) async {
    final event = await SimpleMessageDialog(context, title: intl(context).confirm, message: intl(context).confirmDeletingWith(recipe.title), positiveButton: intl(context).doDelete, negativeButton: intl(context).cancel).show();
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

  Future<void> _pickupProfileImage(BuildContext context, WidgetRef ref, ValueNotifier<List<Content>> images) async {
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

  Future<void> _deleteImage(Content image, ValueNotifier<List<Content>> images) async {
    images.value = List.from(images.value..remove(image));
  }

  Future<void> _upImage(Content image, ValueNotifier<List<Content>> images) async {
    final originalIndex = images.value.indexOf(image);
    if (originalIndex <= 0) return;
    images.value = List.from(
      images.value
        ..removeAt(originalIndex)
        ..insert(originalIndex - 1, image),
    );
  }

  Future<void> _downImage(Content image, ValueNotifier<List<Content>> images) async {
    final originalIndex = images.value.indexOf(image);
    if (originalIndex < 0 || (images.value.length - 2) < originalIndex) return;
    images.value = List.from(
      images.value
        ..removeAt(originalIndex)
        ..insert(originalIndex + 1, image),
    );
  }
}
