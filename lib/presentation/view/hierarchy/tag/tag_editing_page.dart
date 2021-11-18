import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/global/modal/simple_message_dialog.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/editing_result.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagEditingPage extends HookConsumerWidget {
  const TagEditingPage({final Key? key, this.tag}) : super(key: key);

  final Tag? tag;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    ref
      ..listen<bool>(tagEditingViewModelProvider.select((viewModel) => viewModel.isLoading), (previous, isLoading) {
        isLoading ? EasyLoading.show() : EasyLoading.dismiss();
      })
      ..listen<Event<EditingResult>>(tagEditingViewModelProvider.select((viewModel) => viewModel.completionEvent), (previous, completionEvent) {
        completionEvent((completion) => Navigator.of(context).pop(completion));
      })
      ..listen<Event<Exception>>(tagEditingViewModelProvider.select((viewModel) => viewModel.exceptionEvent), (previous, exceptionEvent) {
        exceptionEvent((exception) => const ExceptionHandler().showMessageDialog(context, ref, exception));
      });
    final tagEditingController = useTextEditingController(text: tag?.name);
    return Scaffold(
      appBar: AppBar(
        title: Text(tag != null ? AppLocalizations.of(context)!.editWith(tag!.name) : AppLocalizations.of(context)!.addTag),
        actions: [
          if (tag != null)
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: AppLocalizations.of(context)!.doDelete,
              onPressed: () => _showConfirmationDeletingDialog(context, ref, tag!),
            ),
        ],
      ),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
          children: <Widget>[
            TextField(
              controller: tagEditingController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: AppLocalizations.of(context)!.tagName, alignLabelWithHint: true, border: const OutlineInputBorder()),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: Text(tag != null ? AppLocalizations.of(context)!.doFix : AppLocalizations.of(context)!.doAdd),
                onPressed: () {
                  if (tag != null) {
                    ref.read(tagEditingViewModelProvider).update(tag!.id, tagEditingController.text);
                  } else {
                    ref.read(tagEditingViewModelProvider).create(tagEditingController.text);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showConfirmationDeletingDialog(final BuildContext context, final WidgetRef ref, final Tag tag) async {
    final event = await SimpleMessageDialog(context, title: AppLocalizations.of(context)!.confirm, message: AppLocalizations.of(context)!.confirmDeletingWith(tag.name), positiveButton: AppLocalizations.of(context)!.doDelete, negativeButton: AppLocalizations.of(context)!.cancel).show();
    if (event != null) {
      await event.when(
        positive: () => ref.read(tagEditingViewModelProvider).delete(tag.id),
        neutral: () {},
        negative: () {},
      );
    }
  }
}
