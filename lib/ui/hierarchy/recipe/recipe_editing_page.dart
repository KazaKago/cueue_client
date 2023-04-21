import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/hooks/global/utils/use_theme.dart';
import 'package:cueue/hooks/hierarchy/photo/use_pickup_recipe_image.dart';
import 'package:cueue/hooks/hierarchy/recipe/use_create_recipe.dart';
import 'package:cueue/hooks/hierarchy/recipe/use_delete_recipe.dart';
import 'package:cueue/hooks/hierarchy/recipe/use_update_recipe.dart';
import 'package:cueue/model/content/content.dart';
import 'package:cueue/model/recipe/recipe.dart';
import 'package:cueue/model/recipe/recipe_registration.dart';
import 'package:cueue/model/tag/tag_id.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:cueue/ui/hierarchy/tag/tag_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipeEditingPage extends HookConsumerWidget {
  const RecipeEditingPage({this.recipe, super.key});

  final Recipe? recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipe = this.recipe;
    final intl = useIntl();
    final deleteRecipe = useDeleteRecipe(ref);

    final images = useState(recipe?.images.toList() ?? []);
    final isPostingImage = useState(false);
    final selectedTagIds = useState(recipe?.tags.map((e) => e.id).toList() ?? []);
    final recipeTitleEditingController = useTextEditingController(text: recipe?.title ?? '');
    final isEnableRegistrationButton = useState(recipeTitleEditingController.text.isNotEmpty);
    recipeTitleEditingController.addListener(() {
      isEnableRegistrationButton.value = recipeTitleEditingController.text.isNotEmpty;
    });
    final recipeUrlEditingController = useTextEditingController(text: recipe?.url?.toString() ?? '');
    final recipeDescriptionEditingController = useTextEditingController(text: recipe?.description ?? '');
    final scrollController = useScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe != null ? intl.editWith(recipe.title) : intl.addRecipe),
        actions: [
          if (recipe != null)
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: intl.doDelete,
              onPressed: () => deleteRecipe.trigger(recipe.id),
            ),
        ],
      ),
      body: Scrollbar(
        controller: scrollController,
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
          children: <Widget>[
            _buildTitle(recipeTitleEditingController),
            const SizedBox(height: 16),
            ..._buildImages(images),
            ..._buildLoadingImage(ref, isPostingImage),
            _buildImageAdding(ref, images, isPostingImage),
            const SizedBox(height: 16),
            _buildUrl(recipeUrlEditingController),
            const SizedBox(height: 24),
            _buildDescription(recipeDescriptionEditingController),
            const SizedBox(height: 24),
            TagChips(selectedTagIds),
            const SizedBox(height: 24),
            _buildRegisterButton(ref, recipeTitleEditingController, recipeDescriptionEditingController, recipeUrlEditingController, images.value, selectedTagIds.value, isEnableRegistrationButton.value),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(TextEditingController recipeTitleEditingController) {
    final intl = useIntl();
    return TextField(
      controller: recipeTitleEditingController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: intl.recipeName, alignLabelWithHint: true, border: const OutlineInputBorder()),
    );
  }

  List<Widget> _buildLoadingImage(WidgetRef ref, ValueNotifier<bool> isPostingImage) {
    final intl = useIntl();
    final theme = useTheme();
    final widgetList = <Widget>[];
    if (isPostingImage.value) {
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
                        color: theme.dividerColor,
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
              Text(intl.uploading, style: theme.textTheme.bodyLarge?.copyWith(color: theme.textTheme.bodySmall?.color)),
            ],
          ),
        )
        ..add(const SizedBox(height: 8));
    }
    return widgetList;
  }

  List<Widget> _buildImages(ValueNotifier<List<Content>> images) {
    final intl = useIntl();
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
                        TextButton.icon(onPressed: (0 < index) ? () => _upImage(image, images) : null, icon: const Icon(Icons.keyboard_arrow_up), label: Text(intl.toUp)),
                        TextButton.icon(onPressed: (index < (images.value.length - 1)) ? () => _downImage(image, images) : null, icon: const Icon(Icons.keyboard_arrow_down), label: Text(intl.toDown)),
                      ],
                    ),
                    const SizedBox(width: 32),
                    TextButton.icon(onPressed: () => _deleteImage(image, images), icon: const Icon(Icons.clear), label: Text(intl.delete)),
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

  Widget _buildImageAdding(WidgetRef ref, ValueNotifier<List<Content>> images, ValueNotifier<bool> isPostingImage) {
    final intl = useIntl();
    final theme = useTheme();
    final pickupRecipeImage = usePickupRecipeImage(ref, images, isPostingImage);
    return InkWell(
      onTap: () => pickupRecipeImage.trigger(null),
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
                  Container(color: theme.dividerColor, width: 96, height: 96),
                  Icon(Icons.add, size: 48, color: theme.scaffoldBackgroundColor),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(intl.addRecipeImage, style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.primary)),
        ],
      ),
    );
  }

  Widget _buildUrl(TextEditingController recipeUrlEditingController) {
    final intl = useIntl();
    return TextField(
      controller: recipeUrlEditingController,
      keyboardType: TextInputType.url,
      decoration: InputDecoration(labelText: intl.referenceLink, alignLabelWithHint: true, border: const OutlineInputBorder()),
    );
  }

  Widget _buildDescription(TextEditingController recipeDescriptionEditingController) {
    final intl = useIntl();
    return TextField(
      controller: recipeDescriptionEditingController,
      keyboardType: TextInputType.multiline,
      minLines: 8,
      maxLines: null,
      decoration: InputDecoration(labelText: intl.description, alignLabelWithHint: true, border: const OutlineInputBorder()),
    );
  }

  Widget _buildRegisterButton(WidgetRef ref, TextEditingController recipeTitleEditingController, TextEditingController recipeDescriptionEditingController, TextEditingController recipeUrlEditingController, List<Content> images, List<TagId> selectedTagIds, bool isEnableRegistrationButton) {
    final intl = useIntl();
    final updateRecipe = useUpdateRecipe(ref);
    final createRecipe = useCreateRecipe(ref);
    final recipe = this.recipe;
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.save),
        label: Text(recipe != null ? intl.doFix : intl.doAdd),
        onPressed: isEnableRegistrationButton
            ? () {
                final recipeRegistration = RecipeRegistration(
                  title: recipeTitleEditingController.text,
                  description: recipeDescriptionEditingController.text,
                  url: recipeUrlEditingController.text.isNotEmpty ? Uri.parse(recipeUrlEditingController.text) : null,
                  imageKeys: images.map((e) => e.key).toList(),
                  tagIds: selectedTagIds,
                );
                if (recipe != null) {
                  updateRecipe.trigger(UpdateRecipeData(recipe.id, recipeRegistration));
                } else {
                  createRecipe.trigger(recipeRegistration);
                }
              }
            : null,
      ),
    );
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
