import 'package:cueue/legacy/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/legacy/presentation/view/global/l10n/intl.dart';
import 'package:cueue/legacy/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/legacy/presentation/viewmodel/global/event.dart';
import 'package:cueue/model/edit/editing_result.dart';
import 'package:cueue/model/menu/menu.dart';
import 'package:cueue/model/menu/time_frame.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog_event.dart';
import 'package:cueue/ui/global/widget/text_field_date_picker.dart';
import 'package:cueue/ui/hierarchy/menu/time_frame_extension.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_selection_page.dart';
import 'package:cueue/ui/hierarchy/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class MenuEditingPage extends HookConsumerWidget {
  factory MenuEditingPage({Key? key}) {
    return MenuEditingPage._(key: key);
  }

  factory MenuEditingPage.withMenu({required Menu menu, Key? key}) {
    return MenuEditingPage._(menu: menu, key: key);
  }

  factory MenuEditingPage.withRecipes({required List<RecipeSummary> recipes, Key? key}) {
    return MenuEditingPage._(recipes: recipes, key: key);
  }

  factory MenuEditingPage.withRecipe({required RecipeSummary recipe, Key? key}) {
    return MenuEditingPage._(recipes: [recipe], key: key);
  }

  const MenuEditingPage._({this.menu, this.recipes, super.key});

  final Menu? menu;
  final List<RecipeSummary>? recipes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(menuEditingViewModelProvider);
    final selectedDateTime = useState(menu?.date ?? DateTime.now());
    final selectedRecipes = useState(menu?.recipes.toList() ?? recipes ?? []);
    final selectedTimeFrame = useState(menu?.timeFrame ?? TimeFrame.dinner);
    final menuMemoEditingController = useTextEditingController(text: menu?.memo ?? '');
    final isEnableSubmitButton = useState(false)..value = viewModel.validate(selectedRecipes.value.length, menuMemoEditingController.text);
    menuMemoEditingController.addListener(() {
      isEnableSubmitButton.value = viewModel.validate(selectedRecipes.value.length, menuMemoEditingController.text);
    });
    ref
      ..listen<Event<EditingResult>>(menuEditingViewModelProvider.select((viewModel) => viewModel.completionEvent), (previous, completionEvent) {
        completionEvent((completion) => Navigator.of(context).pop(completion));
      })
      ..listen<Event<Exception>>(menuEditingViewModelProvider.select((viewModel) => viewModel.exceptionEvent), (previous, exceptionEvent) {
        exceptionEvent((exception) => const ExceptionHandler().showMessageDialog(context, ref, exception));
      })
      ..listen<bool>(menuEditingViewModelProvider.select((viewModel) => viewModel.isLoading), (previous, isLoading) {
        isLoading ? EasyLoading.show() : EasyLoading.dismiss();
      });
    final scrollController = useScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text(menu != null ? intl(context).editCookingMenu : intl(context).addCookingMenu),
        actions: [
          if (menu != null)
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: intl(context).doDelete,
              onPressed: () => _showConfirmationDeletingDialog(context, ref, menu!),
            ),
        ],
      ),
      body: Scrollbar(
        controller: scrollController,
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
          children: <Widget>[
            _buildDatePicker(context, ref, selectedDateTime),
            const SizedBox(height: 24),
            _buildTimeFrame(context, ref, selectedTimeFrame),
            const SizedBox(height: 8),
            ..._buildRecipes(context, ref, selectedRecipes),
            _buildAddRecipe(context, ref, selectedRecipes),
            const SizedBox(height: 8),
            _buildMemo(context, ref, menuMemoEditingController),
            const SizedBox(height: 24),
            _buildDoneButton(context, ref, menuMemoEditingController, selectedDateTime.value, selectedTimeFrame.value, selectedRecipes.value, isEnableSubmitButton.value),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context, WidgetRef ref, ValueNotifier<DateTime> selectedDateTime) {
    return TextFieldDatePicker(
      labelText: intl(context).date,
      dateFormat: DateFormat(intl(context).dateFormat, Localizations.localeOf(context).toString()),
      suffixIcon: const Icon(Icons.arrow_drop_down),
      initialDate: selectedDateTime.value,
      onDateChanged: (value) => selectedDateTime.value = value,
    );
  }

  Widget _buildTimeFrame(BuildContext context, WidgetRef ref, ValueNotifier<TimeFrame> selectedTimeFrame) {
    return DropdownButtonFormField<TimeFrame>(
      decoration: InputDecoration(labelText: intl(context).timeFrame, alignLabelWithHint: true, border: const OutlineInputBorder()),
      value: selectedTimeFrame.value,
      items: TimeFrame.values.map((value) {
        return DropdownMenuItem(value: value, child: Text(value.toFormattedString(context)));
      }).toList(),
      onChanged: (newValue) {
        if (newValue == null) return;
        selectedTimeFrame.value = newValue;
      },
    );
  }

  List<Widget> _buildRecipes(BuildContext context, WidgetRef ref, ValueNotifier<List<RecipeSummary>> selectedRecipes) {
    return selectedRecipes.value.map((recipe) {
      return ListTile(
        title: Text(recipe.title),
        trailing: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => _deleteRecipe(context, ref, recipe, selectedRecipes),
        ),
      );
    }).toList();
  }

  Widget _buildAddRecipe(BuildContext context, WidgetRef ref, ValueNotifier<List<RecipeSummary>> selectedRecipes) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(onPressed: () => _goRecipeSelection(context, ref, selectedRecipes), icon: const Icon(Icons.list), label: Text(intl(context).searchFromList, textAlign: TextAlign.center)),
        TextButton.icon(onPressed: () => _goRecipeSearch(context, ref, selectedRecipes), icon: const Icon(Icons.search), label: Text(intl(context).searchFromKeyword, textAlign: TextAlign.center)),
      ],
    );
  }

  Widget _buildMemo(BuildContext context, WidgetRef ref, TextEditingController menuMemoEditingController) {
    return TextField(
      controller: menuMemoEditingController,
      keyboardType: TextInputType.multiline,
      minLines: 6,
      maxLines: null,
      decoration: InputDecoration(labelText: intl(context).memo, alignLabelWithHint: true, border: const OutlineInputBorder()),
    );
  }

  Widget _buildDoneButton(BuildContext context, WidgetRef ref, TextEditingController menuMemoEditingController, DateTime selectedDateTime, TimeFrame selectedTimeFrame, List<RecipeSummary> selectedRecipes, bool isEnableSubmitButton) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.save),
        label: Text(menu != null ? intl(context).doFix : intl(context).doAdd),
        onPressed: isEnableSubmitButton
            ? () {
                final viewModel = ref.read(menuEditingViewModelProvider);
                if (menu != null) {
                  viewModel.update(menu!.id, menuMemoEditingController.text, selectedDateTime, selectedTimeFrame, selectedRecipes.map((e) => e.id).toList());
                } else {
                  viewModel.create(menuMemoEditingController.text, selectedDateTime, selectedTimeFrame, selectedRecipes.map((e) => e.id).toList());
                }
              }
            : null,
      ),
    );
  }

  Future<void> _showConfirmationDeletingDialog(BuildContext context, WidgetRef ref, Menu menu) async {
    final event = await showDialog<SimpleMessageDialogEvent>(
      context: context,
      builder: (context) => SimpleMessageDialog(title: intl(context).confirm, message: intl(context).confirmDeleteCookingMenu, positiveButton: intl(context).doDelete, negativeButton: intl(context).cancel),
    );
    if (event != null) {
      await event.when(
        positive: () async {
          final viewModel = ref.read(menuEditingViewModelProvider);
          await viewModel.delete(menu.id);
        },
        neutral: () {},
        negative: () {},
      );
    }
  }

  Future<void> _goRecipeSelection(BuildContext context, WidgetRef ref, ValueNotifier<List<RecipeSummary>> selectedRecipes) async {
    final result = await Navigator.push<List<RecipeSummary>>(context, MaterialPageRoute(builder: (context) => RecipeSelectionPage(selectedRecipes.value)));
    if (result != null) {
      selectedRecipes.value = result;
    }
  }

  Future<void> _goRecipeSearch(BuildContext context, WidgetRef ref, ValueNotifier<List<RecipeSummary>> selectedRecipes) async {
    final result = await Navigator.push<List<RecipeSummary>>(context, MaterialPageRoute(builder: (context) => SearchPage(initialSelectedRecipes: selectedRecipes.value)));
    if (result != null) {
      selectedRecipes.value = result;
    }
  }

  Future<void> _deleteRecipe(BuildContext context, WidgetRef ref, RecipeSummary recipe, ValueNotifier<List<RecipeSummary>> selectedRecipes) async {
    selectedRecipes.value = List.from(selectedRecipes.value..remove(recipe));
  }
}