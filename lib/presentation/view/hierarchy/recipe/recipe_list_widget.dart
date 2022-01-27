import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
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
  const RecipeListWidget({this.tag, this.selectedRecipes, this.onTap, final Key? key}) : super(key: key);

  final Tag? tag;
  final List<RecipeSummary>? selectedRecipes;
  final void Function(RecipeSummary recipe)? onTap;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final state = ref.watch(recipeViewModelProvider(tag?.id).select((viewModel) => viewModel.state));
    final viewModel = ref.read(recipeViewModelProvider(tag?.id));
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

  Widget _buildLoading(final BuildContext context, final WidgetRef ref) {
    return ShimmerContainer(
      child: Wrap(
        direction: Axis.horizontal,
        children: List.filled(10, const RecipeLoadingItem()),
      ),
    );
  }

  Widget _buildAdditionalLoading(final BuildContext context, final WidgetRef ref, final ScrollController scrollController, final List<RecipeSummary> recipes) {
    final viewModel = ref.read(recipeViewModelProvider(tag?.id));
    final recipeSelectionViewModel = ref.read(recipeSelectionViewModelProvider(selectedRecipes ?? []));
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: Scrollbar(
        child: ListView.builder(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: recipes.length + 1,
          itemBuilder: (BuildContext context, int index) {
            var selectedRecipes = this.selectedRecipes;
            if (selectedRecipes != null) {
              selectedRecipes = recipeSelectionViewModel.selectedRecipes;
            }
            if (index < recipes.length) {
              return RecipeItem(
                title: recipes[index].title,
                description: intl(context).lastCookingAt(recipes[index].lastCookingAt?.toDateString(context) ?? intl(context).notYetCooking),
                thumbnail: recipes[index].image?.url,
                isCheck: selectedRecipes?.map((e) => e.id).contains(recipes[index].id),
                onTap: () => onTap?.call(recipes[index]),
              );
            } else {
              return const LoadingListItem();
            }
          },
        ),
      ),
    );
  }

  Widget _buildEmpty(final BuildContext context, final WidgetRef ref) {
    return EmptyWidget(intl(context).no_recipe_message);
  }

  Widget _buildCompleted(final BuildContext context, final WidgetRef ref, final ScrollController scrollController, final List<RecipeSummary> recipes) {
    final viewModel = ref.read(recipeViewModelProvider(tag?.id));
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: Scrollbar(
        child: ListView.builder(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: recipes.length,
          itemBuilder: (BuildContext context, int index) {
            bool? isCheck;
            if (selectedRecipes != null) {
              final _selectedRecipes = ref.watch(recipeSelectionViewModelProvider(selectedRecipes!).select((viewModel) => viewModel.selectedRecipes));
              isCheck = _selectedRecipes.map((e) => e.id).contains(recipes[index].id);
            }
            return RecipeItem(
              title: recipes[index].title,
              description: intl(context).lastCookingAt(recipes[index].lastCookingAt?.toDateString(context) ?? intl(context).notYetCooking),
              thumbnail: recipes[index].image?.url,
              isCheck: isCheck,
              onTap: () => onTap?.call(recipes[index]),
            );
          },
        ),
      ),
    );
  }

  Widget _buildError(final BuildContext context, final WidgetRef ref, final Exception exception) {
    final viewModel = ref.read(recipeViewModelProvider(tag?.id));
    return ErrorHandlingWidget(exception, onClickRetry: viewModel.retry);
  }

  Widget _buildAdditionalError(final BuildContext context, final WidgetRef ref, final ScrollController scrollController, final List<RecipeSummary> recipes, final Exception exception) {
    final viewModel = ref.read(recipeViewModelProvider(tag?.id));
    final recipeSelectionViewModel = ref.read(recipeSelectionViewModelProvider(selectedRecipes ?? []));
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      child: Scrollbar(
        child: ListView.builder(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: recipes.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index < recipes.length) {
              var selectedRecipes = this.selectedRecipes;
              if (selectedRecipes != null) {
                selectedRecipes = recipeSelectionViewModel.selectedRecipes;
              }
              return RecipeItem(
                title: recipes[index].title,
                description: intl(context).lastCookingAt(recipes[index].lastCookingAt?.toDateString(context) ?? intl(context).notYetCooking),
                thumbnail: recipes[index].image?.url,
                isCheck: selectedRecipes?.map((e) => e.id).contains(recipes[index].id),
                onTap: () => onTap?.call(recipes[index]),
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
