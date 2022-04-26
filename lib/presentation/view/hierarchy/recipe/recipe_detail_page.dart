import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/domain/model/hierarchy/content/content.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/extension/date_time_extension.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/global/widget/loading_list_item.dart';
import 'package:cueue/presentation/view/global/widget/titled_card.dart';
import 'package:cueue/presentation/view/hierarchy/menu/menu_editing_page.dart';
import 'package:cueue/presentation/view/hierarchy/photo/photo_page.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_editing_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/editing_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeDetailPage extends HookConsumerWidget {
  const RecipeDetailPage(this.recipe, {Key? key}) : super(key: key);

  final RecipeSummary recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

  Widget _buildLoading(BuildContext context, WidgetRef ref, int selectedPhotoIndex, RecipeSummary recipe) {
    final viewModel = ref.read(recipeDetailViewModelProvider(recipe.id));
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
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

  Widget _buildError(BuildContext context, WidgetRef ref, int selectedPhotoIndex, RecipeSummary recipe, Exception exception) {
    final viewModel = ref.read(recipeDetailViewModelProvider(recipe.id));
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
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

  Widget _buildCompleted(BuildContext context, WidgetRef ref, ValueNotifier<int> selectedPhotoIndex, Recipe recipe) {
    final viewModel = ref.read(recipeDetailViewModelProvider(recipe.id));
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            iconTheme: ThemeData.dark().iconTheme,
            stretch: true,
            expandedHeight: MediaQuery.of(context).size.width,
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                tooltip: intl(context).doEdit,
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

  Widget _buildTitle(BuildContext context, WidgetRef ref, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Text(title, style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildMainImageFrame(BuildContext context, WidgetRef ref, int selectedPhotoIndex, List<Content> images) {
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

  Widget _buildMainImage(BuildContext context, WidgetRef ref, int selectedPhotoIndex, List<Content> images) {
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

  Widget _buildImageList(BuildContext context, WidgetRef ref, ValueNotifier<int> selectedPhotoIndex, List<Content> images) {
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
                      return DecoratedBox(
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

  Widget _buildUrl(BuildContext context, WidgetRef ref, Uri? url) {
    if (url != null) {
      return Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: TextButton.icon(
              icon: const Icon(Icons.link),
              label: Text(intl(context).referenceLink),
              onPressed: () => launchUrl(url),
            ),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _buildTagChips(BuildContext context, WidgetRef ref, List<Tag> tags) {
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

  Widget _buildDescription(BuildContext context, WidgetRef ref, String description) {
    return TitledCard(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      title: intl(context).description,
      child: Text(description),
    );
  }

  Widget _buildCount(BuildContext context, WidgetRef ref, int cookingCount) {
    return TitledCard(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      title: intl(context).cookingCount,
      child: Text(intl(context).countWith(cookingCount.toString())),
    );
  }

  Widget _buildHistory(BuildContext context, WidgetRef ref, List<DateTime> cookingHistories) {
    if (cookingHistories.isNotEmpty) {
      var index = 0;
      return TitledCard.list(
        margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        title: intl(context).cookingHistory,
        children: cookingHistories.map((date) {
          index++;
          return Text('$index. ${date.toDateString(context)}');
        }).toList(),
      );
    } else {
      return TitledCard(
        margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        title: intl(context).cookingHistory,
        child: Text(intl(context).notYetCooking),
      );
    }
  }

  Widget _buildCreatedAt(BuildContext context, WidgetRef ref, DateTime createdAt) {
    return TitledCard(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      title: intl(context).recipeCreatedAt,
      child: Text(createdAt.toDateTimeString(context)),
    );
  }

  Widget _buildUpdatedAt(BuildContext context, WidgetRef ref, DateTime updatedAt) {
    return TitledCard(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      title: intl(context).recipeUpdatedAt,
      child: Text(updatedAt.toDateTimeString(context)),
    );
  }

  Widget _buildRegistrationMenuButton(BuildContext context, WidgetRef ref, RecipeSummary recipe) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
        child: OutlinedButton(
          onPressed: () => _goMenuEditing(context, recipe),
          child: Text(intl(context).useRecipeToMenu),
        ),
      ),
    );
  }

  Future<void> _goRecipeEditing(BuildContext context, Recipe recipe) async {
    final result = await Navigator.push<EditingResult>(context, MaterialPageRoute(builder: (context) => RecipeEditingPage(recipe: recipe)));
    if (result == EditingResult.deleted) {
      Navigator.of(context).pop();
    }
  }

  Future<void> _goPhoto(BuildContext context, List<Uri> imageUris, int index) async {
    await Navigator.push<EditingResult>(context, MaterialPageRoute(builder: (context) => PhotoPage(imageUris: imageUris, initialIndex: index)));
  }

  Future<void> _goMenuEditing(BuildContext context, RecipeSummary recipe) async {
    await Navigator.push<EditingResult>(context, MaterialPageRoute(builder: (context) => MenuEditingPage.withRecipe(recipe: recipe)));
  }

  int _fixedSelectedIndex(int selectedPhotoIndex, int imageLength) {
    return (imageLength <= selectedPhotoIndex) ? 0 : selectedPhotoIndex;
  }
}
