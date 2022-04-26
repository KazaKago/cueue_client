import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/global/modal/simple_message_dialog.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/editing_result.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagEditingPage extends HookConsumerWidget {
  const TagEditingPage({Key? key, this.tag}) : super(key: key);

  final Tag? tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        title: Text(tag != null ? intl(context).editWith(tag!.name) : intl(context).addTag),
        actions: [
          if (tag != null)
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: intl(context).doDelete,
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
              decoration: InputDecoration(labelText: intl(context).tagName, alignLabelWithHint: true, border: const OutlineInputBorder()),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: Text(tag != null ? intl(context).doFix : intl(context).doAdd),
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

  Future<void> _showConfirmationDeletingDialog(BuildContext context, WidgetRef ref, Tag tag) async {
    final event = await SimpleMessageDialog(context, title: intl(context).confirm, message: intl(context).confirmDeletingWith(tag.name), positiveButton: intl(context).doDelete, negativeButton: intl(context).cancel).show();
    if (event != null) {
      await event.when(
        positive: () => ref.read(tagEditingViewModelProvider).delete(tag.id),
        neutral: () {},
        negative: () {},
      );
    }
  }
}
