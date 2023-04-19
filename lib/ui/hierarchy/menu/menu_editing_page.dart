import 'package:cueue/hooks/global/utils/use_date_format.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/hierarchy/menu/use_create_menu.dart';
import 'package:cueue/hooks/hierarchy/menu/use_delete_menu.dart';
import 'package:cueue/hooks/hierarchy/menu/use_menu_registration_validation.dart';
import 'package:cueue/hooks/hierarchy/menu/use_timeframe_formatter.dart';
import 'package:cueue/hooks/hierarchy/menu/use_update_menu.dart';
import 'package:cueue/model/menu/menu.dart';
import 'package:cueue/model/menu/menu_registration.dart';
import 'package:cueue/model/menu/time_frame.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:cueue/ui/global/widget/text_field_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    final menu = this.menu;
    final intl = useIntl();
    final deleteMenu = useDeleteMenu(ref);
    final menuRegistrationValidation = useMenuRegistrationValidation();

    final selectedDateTime = useState(menu?.date ?? DateTime.now());
    final selectedRecipes = useState(menu?.recipes.toList() ?? recipes ?? []);
    final selectedTimeFrame = useState(menu?.timeFrame ?? TimeFrame.dinner);
    final menuMemoEditingController = useTextEditingController(text: menu?.memo ?? '');
    final isEnableSubmitButton = useState(false)..value = menuRegistrationValidation(selectedRecipes.value.length, menuMemoEditingController.text);
    menuMemoEditingController.addListener(() {
      isEnableSubmitButton.value = menuRegistrationValidation(selectedRecipes.value.length, menuMemoEditingController.text);
    });
    final scrollController = useScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text(menu != null ? intl.editCookingMenu : intl.addCookingMenu),
        actions: [
          if (menu != null)
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: intl.doDelete,
              onPressed: () => deleteMenu.trigger(menu.id),
            ),
        ],
      ),
      body: Scrollbar(
        controller: scrollController,
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
          children: <Widget>[
            _buildDatePicker(ref, selectedDateTime),
            const SizedBox(height: 24),
            _buildTimeFrame(ref, selectedTimeFrame),
            const SizedBox(height: 8),
            ..._buildRecipes(ref, selectedRecipes),
            _buildAddRecipe(ref, selectedRecipes),
            const SizedBox(height: 8),
            _buildMemo(ref, menuMemoEditingController),
            const SizedBox(height: 24),
            _buildDoneButton(ref, menuMemoEditingController, selectedDateTime.value, selectedTimeFrame.value, selectedRecipes.value, isEnableSubmitButton.value),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker(WidgetRef ref, ValueNotifier<DateTime> selectedDateTime) {
    final intl = useIntl();
    final dateFormat = useDateFormat();
    return TextFieldDatePicker(
      labelText: intl.date,
      dateFormat: dateFormat,
      suffixIcon: const Icon(Icons.arrow_drop_down),
      initialDate: selectedDateTime.value,
      onDateChanged: (value) => selectedDateTime.value = value,
    );
  }

  Widget _buildTimeFrame(WidgetRef ref, ValueNotifier<TimeFrame> selectedTimeFrame) {
    final intl = useIntl();
    final toFormattedString = useToFormattedString();
    return DropdownButtonFormField<TimeFrame>(
      decoration: InputDecoration(labelText: intl.timeFrame, alignLabelWithHint: true, border: const OutlineInputBorder()),
      value: selectedTimeFrame.value,
      items: TimeFrame.values.map((value) {
        return DropdownMenuItem(value: value, child: Text(toFormattedString(value)));
      }).toList(),
      onChanged: (newValue) {
        if (newValue == null) return;
        selectedTimeFrame.value = newValue;
      },
    );
  }

  List<Widget> _buildRecipes(WidgetRef ref, ValueNotifier<List<RecipeSummary>> selectedRecipes) {
    return selectedRecipes.value.map((recipe) {
      return ListTile(
        title: Text(recipe.title),
        trailing: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            selectedRecipes.value = List.from(selectedRecipes.value..remove(recipe));
          },
        ),
      );
    }).toList();
  }

  Widget _buildAddRecipe(WidgetRef ref, ValueNotifier<List<RecipeSummary>> selectedRecipes) {
    final intl = useIntl();
    final pushRecipeSelectionPage = usePushRecipeSelectionPage();
    final pushSearchPage = usePushSearchPage();
    useEffectSWRData<List<RecipeSummary>, List<RecipeSummary>?>(pushRecipeSelectionPage, (data) {
      if (data != null) {
        selectedRecipes.value = data;
      }
    });
    useEffectSWRData<List<RecipeSummary>?, List<RecipeSummary>?>(pushSearchPage, (data) {
      if (data != null) {
        selectedRecipes.value = data;
      }
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(onPressed: () => pushRecipeSelectionPage.trigger(selectedRecipes.value), icon: const Icon(Icons.list), label: Text(intl.searchFromList, textAlign: TextAlign.center)),
        TextButton.icon(onPressed: () => pushSearchPage.trigger(selectedRecipes.value), icon: const Icon(Icons.search), label: Text(intl.searchFromKeyword, textAlign: TextAlign.center)),
      ],
    );
  }

  Widget _buildMemo(WidgetRef ref, TextEditingController menuMemoEditingController) {
    final intl = useIntl();
    return TextField(
      controller: menuMemoEditingController,
      keyboardType: TextInputType.multiline,
      minLines: 6,
      maxLines: null,
      decoration: InputDecoration(labelText: intl.memo, alignLabelWithHint: true, border: const OutlineInputBorder()),
    );
  }

  Widget _buildDoneButton(WidgetRef ref, TextEditingController menuMemoEditingController, DateTime selectedDateTime, TimeFrame selectedTimeFrame, List<RecipeSummary> selectedRecipes, bool isEnableSubmitButton) {
    final menu = this.menu;
    final intl = useIntl();
    final createMenu = useCreateMenu(ref);
    final updateMenu = useUpdateMenu(ref);
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.save),
        label: Text(menu != null ? intl.doFix : intl.doAdd),
        onPressed: isEnableSubmitButton
            ? () {
                if (menu != null) {
                  updateMenu.trigger(
                    UpdateMenuData(
                      menu.id,
                      MenuRegistration(
                        memo: menuMemoEditingController.text,
                        date: selectedDateTime,
                        timeFrame: selectedTimeFrame,
                        recipeIds: selectedRecipes.map((e) => e.id).toList(),
                      ),
                    ),
                  );
                } else {
                  createMenu.trigger(
                    MenuRegistration(
                      memo: menuMemoEditingController.text,
                      date: selectedDateTime,
                      timeFrame: selectedTimeFrame,
                      recipeIds: selectedRecipes.map((e) => e.id).toList(),
                    ),
                  );
                }
              }
            : null,
      ),
    );
  }
}
