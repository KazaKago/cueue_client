import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/domain/model/hierarchy/content/content.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/presentation/view/global/extension/date_time_extension.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/global/widget/loading_list_item.dart';
import 'package:cueue/presentation/view/global/widget/styled_card_widget.dart';
import 'package:cueue/presentation/view/hierarchy/menu/menu_editing_page.dart';
import 'package:cueue/presentation/view/hierarchy/photo/photo_page.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_editing_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/editing_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeDetailPage extends HookConsumerWidget {
  const RecipeDetailPage(this.recipe, {final Key? key}) : super(key: key);

  final RecipeSummary recipe;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final selectedPhotoIndex = useState(0);
    final state = ref.watch(recipeDetailViewModelProvider(recipe.id).select((viewModel) => viewModel.state));
    return Scaffold(
      body: state.when(
        loading: () => _buildLoading(context, ref, selectedPhotoIndex.value, recipe),
        completed: (recipe) => _buildCompleted(context, ref, selectedPhotoIndex, recipe),
        error: (exception) => _buildError(context, ref, selectedPhotoIndex.value, recipe, exception),
      ),
    );
  }

  Widget _buildLoading(final BuildContext context, final WidgetRef ref, final int selectedPhotoIndex, final RecipeSummary recipe) {
    final viewModel = ref.read(recipeDetailViewModelProvider(recipe.id));
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            brightness: Brightness.dark,
            iconTheme: ThemeData.dark().iconTheme,
            stretch: true,
            expandedHeight: MediaQuery.of(context).size.width,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildMainImageFrame(context, ref, selectedPhotoIndex, (recipe.image != null) ? [recipe.image!] : []),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const LoadingListItem(),
              const SizedBox(height: 32),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildError(final BuildContext context, final WidgetRef ref, final int selectedPhotoIndex, final RecipeSummary recipe, final Exception exception) {
    final viewModel = ref.read(recipeDetailViewModelProvider(recipe.id));
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            brightness: Brightness.dark,
            iconTheme: ThemeData.dark().iconTheme,
            stretch: true,
            expandedHeight: MediaQuery.of(context).size.width,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildMainImageFrame(context, ref, selectedPhotoIndex, (recipe.image != null) ? [recipe.image!] : []),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ErrorHandlingWidget(exception, onClickRetry: viewModel.retry),
              const SizedBox(height: 32),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildCompleted(final BuildContext context, final WidgetRef ref, final ValueNotifier<int> selectedPhotoIndex, final Recipe recipe) {
    final viewModel = ref.read(recipeDetailViewModelProvider(recipe.id));
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            brightness: Brightness.dark,
            iconTheme: ThemeData.dark().iconTheme,
            stretch: true,
            expandedHeight: MediaQuery.of(context).size.width,
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                tooltip: AppLocalizations.of(context)!.doEdit,
                onPressed: () => _goRecipeEditing(context, recipe),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: _buildMainImageFrame(context, ref, selectedPhotoIndex.value, recipe.images),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildImageList(context, ref, selectedPhotoIndex, recipe.images),
              _buildTitle(context, ref, recipe.title),
              _buildTagChips(context, ref, recipe.tags),
              _buildUrl(context, ref, recipe.url),
              _buildDescription(context, ref, recipe.description),
              _buildCount(context, ref, recipe.cookingCount),
              _buildHistory(context, ref, recipe.cookingHistories),
              _buildCreatedAt(context, ref, recipe.createdAt),
              _buildUpdatedAt(context, ref, recipe.updatedAt),
              _buildRegistrationMenuButton(context, ref, recipe),
              const SizedBox(height: 32),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(final BuildContext context, final WidgetRef ref, final String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Text(title, style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildMainImageFrame(final BuildContext context, final WidgetRef ref, final int selectedPhotoIndex, final List<Content> images) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _buildMainImage(context, ref, selectedPhotoIndex, images),
        IgnorePointer(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.white.withOpacity(0),
                  Colors.white.withOpacity(0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMainImage(final BuildContext context, final WidgetRef ref, final int selectedPhotoIndex, final List<Content> images) {
    if (images.isNotEmpty) {
      final image = images[_fixedSelectedIndex(selectedPhotoIndex, images.length)];
      return Ink.image(
        width: double.infinity,
        fit: BoxFit.cover,
        image: CachedNetworkImageProvider(image.url.toString()),
        child: InkWell(
          onTap: () {
            _goPhoto(context, images.map((e) => e.url).toList(), _fixedSelectedIndex(selectedPhotoIndex, images.length));
          },
          child: Container(),
        ),
      );
    } else {
      return Container(
        color: Theme.of(context).dividerColor,
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Assets.images.icAppIcon.image(
            color: Theme.of(context).hoverColor,
          ),
        ),
      );
    }
  }

  Widget _buildImageList(final BuildContext context, final WidgetRef ref, final ValueNotifier<int> selectedPhotoIndex, final List<Content> images) {
    if (1 < images.length) {
      return SizedBox(
        height: 80,
        child: Center(
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return AspectRatio(
                aspectRatio: 1,
                child: InkResponse(
                  onTap: () => selectedPhotoIndex.value = index,
                  child: CachedNetworkImage(
                    imageUrl: images[index].url.toString(),
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                          border: (index == _fixedSelectedIndex(selectedPhotoIndex.value, images.length)) ? Border.all(color: Theme.of(context).colorScheme.primary, width: 3) : null,
                          borderRadius: BorderRadius.circular(40),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 16);
            },
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildUrl(final BuildContext context, final WidgetRef ref, final Uri? url) {
    if (url != null) {
      return Wrap(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: TextButton.icon(
            icon: const Icon(Icons.link),
            label: Text(AppLocalizations.of(context)!.referenceLink),
            onPressed: () => launch(url.toString()),
          ),
        )
      ]);
    } else {
      return Container();
    }
  }

  Widget _buildTagChips(final BuildContext context, final WidgetRef ref, final List<Tag> tags) {
    if (tags.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Wrap(
          spacing: 12,
          children: tags.map((e) => Chip(label: Text(e.name))).toList(),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildDescription(final BuildContext context, final WidgetRef ref, final String description) {
    return TitledCard(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      title: AppLocalizations.of(context)!.description,
      child: Text(description),
    );
  }

  Widget _buildCount(final BuildContext context, final WidgetRef ref, final int cookingCount) {
    return TitledCard(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      title: AppLocalizations.of(context)!.cookingCount,
      child: Text(AppLocalizations.of(context)!.countWith(cookingCount.toString())),
    );
  }

  Widget _buildHistory(final BuildContext context, final WidgetRef ref, final List<DateTime> cookingHistories) {
    if (cookingHistories.isNotEmpty) {
      var index = 0;
      return TitledCard.list(
        margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        title: AppLocalizations.of(context)!.cookingHistory,
        children: cookingHistories.map((date) {
          index++;
          return Text('$index. ${date.toDateString(context)}');
        }).toList(),
      );
    } else {
      return TitledCard(
        margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        title: AppLocalizations.of(context)!.cookingHistory,
        child: Text(AppLocalizations.of(context)!.notYetCooking),
      );
    }
  }

  Widget _buildCreatedAt(final BuildContext context, final WidgetRef ref, final DateTime createdAt) {
    return TitledCard(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      title: AppLocalizations.of(context)!.recipeCreatedAt,
      child: Text(createdAt.toDateTimeString(context)),
    );
  }

  Widget _buildUpdatedAt(final BuildContext context, final WidgetRef ref, final DateTime updatedAt) {
    return TitledCard(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      title: AppLocalizations.of(context)!.recipeUpdatedAt,
      child: Text(updatedAt.toDateTimeString(context)),
    );
  }

  Widget _buildRegistrationMenuButton(final BuildContext context, final WidgetRef ref, final RecipeSummary recipe) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
        child: OutlinedButton(
          onPressed: () => _goMenuEditing(context, recipe),
          child: Text(AppLocalizations.of(context)!.useRecipeToMenu),
        ),
      ),
    );
  }

  Future<void> _goRecipeEditing(final BuildContext context, final Recipe recipe) async {
    final result = await Navigator.push<EditingResult>(context, MaterialPageRoute(builder: (context) => RecipeEditingPage(recipe: recipe)));
    if (result == EditingResult.deleted) {
      Navigator.of(context).pop();
    }
  }

  Future<void> _goPhoto(final BuildContext context, final List<Uri> imageUris, final int index) async {
    await Navigator.push<EditingResult>(context, MaterialPageRoute(builder: (context) => PhotoPage(imageUris: imageUris, initialIndex: index)));
  }

  Future<void> _goMenuEditing(final BuildContext context, final RecipeSummary recipe) async {
    await Navigator.push<EditingResult>(context, MaterialPageRoute(builder: (context) => MenuEditingPage.withRecipe(recipe: recipe)));
  }

  int _fixedSelectedIndex(final int selectedPhotoIndex, final int imageLength) {
    return (imageLength <= selectedPhotoIndex) ? 0 : selectedPhotoIndex;
  }
}
