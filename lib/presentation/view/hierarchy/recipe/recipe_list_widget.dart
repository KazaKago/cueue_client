import 'package:cueue/domain/model/hierarchy/recipe/recipe_search_option.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/extension/date_time_extension.dart';
import 'package:cueue/presentation/view/global/extension/scroll_controller_extension.dart';
import 'package:cueue/presentation/view/global/widget/empty_widget.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/global/widget/error_list_item.dart';
import 'package:cueue/presentation/view/global/widget/loading_list_item.dart';
import 'package:cueue/presentation/view/global/widget/shimmer_container.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_item.dart';
import 'package:cueue/presentation/view/hierarchy/recipe/recipe_loading_item.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipeListWidget extends HookConsumerWidget {
  factory RecipeListWidget({
    String? keyword,
    List<TagId>? tagIds,
    List<RecipeSummary>? selectedRecipes,
    void Function(RecipeSummary recipe)? onTap,
    bool fabPadding = false,
    Key? key,
  }) {
    return RecipeListWidget._(RecipeSearchOption(keyword: keyword, tagIds: tagIds), selectedRecipes, onTap, fabPadding, key);
  }

  const RecipeListWidget._(this._recipeSearchOption, this._selectedRecipes, this._onTap, this._fabPadding, Key? key) : super(key: key);

  final RecipeSearchOption _recipeSearchOption;
  final List<RecipeSummary>? _selectedRecipes;
  final void Function(RecipeSummary recipe)? _onTap;
  final bool _fabPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recipeViewModelProvider(_recipeSearchOption).select((viewModel) => viewModel.state));
    final viewModel = ref.read(recipeViewModelProvider(_recipeSearchOption));
    final scrollController = useScrollController()..onReachBottomWithAutoDispose(viewModel.requestAddition);
    return state.when(
      loading: () => _buildLoading(context, ref),
      refreshing: (recipes) => _buildCompleted(context, ref, scrollController, recipes),
      additionalLoading: (recipes) => _buildAdditionalLoading(context, ref, scrollController, recipes),
      empty: () => _buildEmpty(context, ref),
      completed: (recipes) => _buildCompleted(context, ref, scrollController, recipes),
      error: (exception) => _buildError(context, ref, exception),
      additionalError: (recipes, exception) => _buildAdditionalError(context, ref, scrollController, recipes, exception),
    );
  }

  Widget _buildLoading(BuildContext context, WidgetRef ref) {
    return ShimmerContainer(
      child: Wrap(
        children: List.filled(10, const RecipeLoadingItem()),
      ),
    );
  }

  Widget _buildAdditionalLoading(BuildContext context, WidgetRef ref, ScrollController scrollController, List<RecipeSummary> recipes) {
    final viewModel = ref.read(recipeViewModelProvider(_recipeSearchOption));
    final recipeSelectionViewModel = ref.read(recipeSelectionViewModelProvider(_selectedRecipes ?? []));
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: Scrollbar(
        controller: scrollController,
        child: ListView.builder(
          padding: _fabPadding ? const EdgeInsets.only(bottom: 70) : null,
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: recipes.length + 1,
          itemBuilder: (BuildContext context, int index) {
            var selectedRecipes = _selectedRecipes;
            if (selectedRecipes != null) {
              selectedRecipes = recipeSelectionViewModel.selectedRecipes;
            }
            if (index < recipes.length) {
              return RecipeItem(
                title: recipes[index].title,
                description: intl(context).lastCookingAt(recipes[index].lastCookingAt?.toDateString(context) ?? intl(context).notYetCooking),
                thumbnail: recipes[index].image?.url,
                isCheck: selectedRecipes?.map((e) => e.id).contains(recipes[index].id),
                onTap: () => _onTap?.call(recipes[index]),
              );
            } else {
              return const LoadingListItem();
            }
          },
        ),
      ),
    );
  }

  Widget _buildEmpty(BuildContext context, WidgetRef ref) {
    return EmptyWidget(intl(context).noRecipeMessage);
  }

  Widget _buildCompleted(BuildContext context, WidgetRef ref, ScrollController scrollController, List<RecipeSummary> recipes) {
    final viewModel = ref.read(recipeViewModelProvider(_recipeSearchOption));
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: Scrollbar(
        controller: scrollController,
        child: ListView.builder(
          padding: _fabPadding ? const EdgeInsets.only(bottom: 70) : null,
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: recipes.length,
          itemBuilder: (BuildContext context, int index) {
            bool? isCheck;
            if (_selectedRecipes != null) {
              final selectedRecipes = ref.watch(recipeSelectionViewModelProvider(_selectedRecipes!).select((viewModel) => viewModel.selectedRecipes));
              isCheck = selectedRecipes.map((e) => e.id).contains(recipes[index].id);
            }
            return RecipeItem(
              title: recipes[index].title,
              description: intl(context).lastCookingAt(recipes[index].lastCookingAt?.toDateString(context) ?? intl(context).notYetCooking),
              thumbnail: recipes[index].image?.url,
              isCheck: isCheck,
              onTap: () => _onTap?.call(recipes[index]),
            );
          },
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, WidgetRef ref, Exception exception) {
    final viewModel = ref.read(recipeViewModelProvider(_recipeSearchOption));
    return ErrorHandlingWidget(exception, onClickRetry: viewModel.retry);
  }

  Widget _buildAdditionalError(BuildContext context, WidgetRef ref, ScrollController scrollController, List<RecipeSummary> recipes, Exception exception) {
    final viewModel = ref.read(recipeViewModelProvider(_recipeSearchOption));
    final recipeSelectionViewModel = ref.read(recipeSelectionViewModelProvider(_selectedRecipes ?? []));
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: Scrollbar(
        controller: scrollController,
        child: ListView.builder(
          padding: _fabPadding ? const EdgeInsets.only(bottom: 70) : null,
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: recipes.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index < recipes.length) {
              var selectedRecipes = _selectedRecipes;
              if (selectedRecipes != null) {
                selectedRecipes = recipeSelectionViewModel.selectedRecipes;
              }
              return RecipeItem(
                title: recipes[index].title,
                description: intl(context).lastCookingAt(recipes[index].lastCookingAt?.toDateString(context) ?? intl(context).notYetCooking),
                thumbnail: recipes[index].image?.url,
                isCheck: selectedRecipes?.map((e) => e.id).contains(recipes[index].id),
                onTap: () => _onTap?.call(recipes[index]),
              );
            } else {
              return ErrorListItem(exception, onClickRetry: viewModel.retryAddition);
            }
          },
        ),
      ),
    );
  }
}
