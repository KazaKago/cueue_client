import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/hooks/global/utils/use_date_format.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/global/utils/use_theme.dart';
import 'package:cueue/hooks/hierarchy/recipe/use_recipe.dart';
import 'package:cueue/model/content/content.dart';
import 'package:cueue/model/recipe/recipe.dart';
import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:cueue/ui/global/widget/error_handling_widget.dart';
import 'package:cueue/ui/global/widget/loading_list_item.dart';
import 'package:cueue/ui/global/widget/titled_card.dart';
import 'package:cueue/ui/hierarchy/photo/photo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeDetailPage extends HookConsumerWidget {
  const RecipeDetailPage({super.key, required this.recipeId, this.recipeSummary});

  final RecipeId recipeId;
  final RecipeSummary? recipeSummary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = useIntl();
    final goNamed = useGoNamed();
    final selectedPhotoIndex = useState(0);
    final recipeState = useRecipe(ref, recipeId);
    final recipe = recipeState.data;
    final error = recipeState.error;
    final Widget sliverList;
    if (recipe != null) {
      sliverList = _buildSliverContent(recipe, selectedPhotoIndex);
    } else if (error != null) {
      sliverList = _buildSliverError(error);
    } else {
      sliverList = _buildSliverLoading();
    }
    final List<Content> photos;
    if (recipe != null) {
      photos = recipe.images;
    } else if (recipeSummary?.image != null) {
      photos = [recipeSummary!.image!];
    } else {
      photos = [];
    }
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => recipeState.mutate(null),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              systemOverlayStyle: SystemUiOverlayStyle.light,
              iconTheme: ThemeData.dark().iconTheme,
              stretch: true,
              expandedHeight: MediaQuery.of(context).size.width,
              actions: [
                if (recipe != null)
                  IconButton(
                    icon: const Icon(Icons.edit),
                    tooltip: intl.doEdit,
                    onPressed: () => goNamed.trigger(
                      GoName(
                        'recipe_editing',
                        pathParameters: {'recipe_id': recipe.id.value.toString()},
                        extra: recipe,
                      ),
                    ),
                  ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: _buildMainImageFrame(selectedPhotoIndex.value, photos),
              ),
            ),
            sliverList,
          ],
        ),
      ),
    );
  }

  Widget _buildSliverContent(Recipe recipe, ValueNotifier<int> selectedPhotoIndex) {
    return SliverList(
      delegate: SliverChildListDelegate([
        _buildImageList(selectedPhotoIndex, recipe.images),
        _buildTitle(recipe.title),
        _buildTagChips(recipe.tags),
        _buildUrl(recipe.url),
        _buildDescription(recipe.description),
        _buildCount(recipe.cookingCount),
        _buildHistory(recipe.cookingHistories),
        _buildCreatedAt(recipe.createdAt),
        _buildUpdatedAt(recipe.updatedAt),
        _buildRegistrationMenuButton(recipe),
        const SizedBox(height: 32),
      ]),
    );
  }

  Widget _buildSliverError(Exception exception) {
    return SliverList(
      delegate: SliverChildListDelegate([
        ErrorHandlingWidget(exception),
        const SizedBox(height: 32),
      ]),
    );
  }

  Widget _buildSliverLoading() {
    return SliverList(
      delegate: SliverChildListDelegate([
        const LoadingListItem(),
        const SizedBox(height: 32),
      ]),
    );
  }

  Widget _buildTitle(String title) {
    final theme = useTheme();
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Text(title, style: theme.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildMainImageFrame(int selectedPhotoIndex, List<Content> images) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _buildMainImage(selectedPhotoIndex, images),
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

  Widget _buildMainImage(int selectedPhotoIndex, List<Content> images) {
    final theme = useTheme();
    final pushPage = usePushPage<void>();
    if (images.isNotEmpty) {
      final image = images[_fixedSelectedIndex(selectedPhotoIndex, images.length)];
      return Ink.image(
        width: double.infinity,
        fit: BoxFit.cover,
        image: CachedNetworkImageProvider(image.url.toString()),
        child: InkWell(
          onTap: () {
            pushPage.trigger(
              PhotoPage(
                imageUris: images.map((e) => e.url).toList(),
                initialIndex: _fixedSelectedIndex(selectedPhotoIndex, images.length),
              ),
            );
          },
          child: Container(),
        ),
      );
    } else {
      return ColoredBox(
        color: theme.dividerColor,
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Assets.images.icAppIcon.image(
            color: theme.hoverColor,
          ),
        ),
      );
    }
  }

  Widget _buildImageList(ValueNotifier<int> selectedPhotoIndex, List<Content> images) {
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

  Widget _buildUrl(Uri? url) {
    final intl = useIntl();
    if (url != null) {
      return Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: TextButton.icon(
              icon: const Icon(Icons.link),
              label: Text(intl.referenceLink),
              onPressed: () => launchUrl(url),
            ),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _buildTagChips(List<Tag> tags) {
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

  Widget _buildDescription(String description) {
    final intl = useIntl();
    return TitledCard(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      title: intl.description,
      child: Text(description),
    );
  }

  Widget _buildCount(int cookingCount) {
    final intl = useIntl();
    return TitledCard(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      title: intl.cookingCount,
      child: Text(intl.countWith(cookingCount.toString())),
    );
  }

  Widget _buildHistory(List<DateTime> cookingHistories) {
    final intl = useIntl();
    final toDateString = useToDateString();
    if (cookingHistories.isNotEmpty) {
      var index = 0;
      return TitledCard.list(
        margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        title: intl.cookingHistory,
        children: cookingHistories.map((date) {
          index++;
          return Text('$index. ${toDateString(date)}');
        }).toList(),
      );
    } else {
      return TitledCard(
        margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        title: intl.cookingHistory,
        child: Text(intl.notYetCooking),
      );
    }
  }

  Widget _buildCreatedAt(DateTime createdAt) {
    final intl = useIntl();
    final toDateTimeString = useToDateTimeString();
    return TitledCard(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      title: intl.recipeCreatedAt,
      child: Text(toDateTimeString(createdAt)),
    );
  }

  Widget _buildUpdatedAt(DateTime updatedAt) {
    final intl = useIntl();
    final toDateTimeString = useToDateTimeString();
    return TitledCard(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      title: intl.recipeUpdatedAt,
      child: Text(toDateTimeString(updatedAt)),
    );
  }

  Widget _buildRegistrationMenuButton(RecipeSummary recipe) {
    final intl = useIntl();
    final goNamed = useGoNamed();
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
        child: OutlinedButton(
          onPressed: () => goNamed.trigger(
            GoName(
              'recipe_editing',
              pathParameters: {'recipe_id': recipe.id.value.toString()},
              extra: recipe,
            ),
          ),
          child: Text(intl.useRecipeToMenu),
        ),
      ),
    );
  }

  int _fixedSelectedIndex(int selectedPhotoIndex, int imageLength) {
    return (imageLength <= selectedPhotoIndex) ? 0 : selectedPhotoIndex;
  }
}
