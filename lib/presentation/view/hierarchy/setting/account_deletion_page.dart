import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/global/modal/simple_message_dialog.dart';
import 'package:cueue/presentation/view/hierarchy/welcome/thanks_for_using_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountDeletionPage extends HookConsumerWidget {
  const AccountDeletionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
      ..listen<Event<void>>(accountDeletionViewModelProvider.select((viewModel) => viewModel.completionEvent), (previous, completionEvent) {
        completionEvent((_) => _replaceThanksForUsingPage(context));
      })
      ..listen<Event<Exception>>(accountDeletionViewModelProvider.select((viewModel) => viewModel.exceptionEvent), (previous, exceptionEvent) {
        exceptionEvent((exception) => _showErrorDialog(context, ref, exception));
      })
      ..listen<bool>(accountDeletionViewModelProvider.select((viewModel) => viewModel.isLoading), (previous, isLoading) {
        isLoading ? EasyLoading.show() : EasyLoading.dismiss();
      });
    return Scaffold(
      appBar: AppBar(title: Text(intl(context).accountDeletion)),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('[WIP]'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Theme.of(context).errorColor),
                    onPressed: () => _showAccountDeletionConfirmationDialog(context, ref),
                    child: Text(intl(context).approveAndDeletionAccount),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showAccountDeletionConfirmationDialog(BuildContext context, WidgetRef ref) async {
    final event = await SimpleMessageDialog(context, title: intl(context).warning, message: intl(context).accountDeletionConfirmation, positiveButton: intl(context).doDelete, negativeButton: intl(context).cancel).show();
    if (event != null) {
      await event.when(
        positive: () async {
          final viewModel = ref.read(accountDeletionViewModelProvider);
          await viewModel.deleteAccount();
        },
        negative: () {},
        neutral: () {},
      );
    }
  }

  Future<void> _replaceThanksForUsingPage(BuildContext context) async {
    await Navigator.pushAndRemoveUntil<void>(context, MaterialPageRoute(builder: (context) => const ThanksForUsingPage()), (_) => false);
  }

  Future<void> _showErrorDialog(BuildContext context, WidgetRef ref, Exception exception) async {
    await const ExceptionHandler().showMessageDialog(context, ref, exception);
  }
}
