import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/global/modal/simple_message_dialog.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PasswordResetPage extends HookConsumerWidget {
  const PasswordResetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailEditingController = useTextEditingController();
    final userEmail = ref.watch(passwordResetViewModelProvider.select((viewModel) => viewModel.userEmail));
    if (userEmail != null) emailEditingController.text = userEmail.value;
    ref
      ..listen<Event<void>>(
        passwordResetViewModelProvider.select((viewModel) => viewModel.completionEvent),
        ((previous, completionEvent) {
          completionEvent((_) => _showSentPasswordResetMailDialog(context));
        }),
      )
      ..listen<Event<Exception>>(
        passwordResetViewModelProvider.select((viewModel) => viewModel.exceptionEvent),
        ((previous, exceptionEvent) {
          exceptionEvent((exception) => const ExceptionHandler().showMessageDialog(context, ref, exception));
        }),
      )
      ..listen<bool>(
        passwordResetViewModelProvider.select((viewModel) => viewModel.isLoading),
        ((previous, isLoading) {
          isLoading ? EasyLoading.show() : EasyLoading.dismiss();
        }),
      );
    return Scaffold(
      appBar: AppBar(
        title: Text(intl(context).passwordReset),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: <Widget>[
          TextField(
            enabled: emailEditingController.text.isEmpty,
            controller: emailEditingController,
            keyboardType: TextInputType.emailAddress,
            autofocus: emailEditingController.text.isEmpty,
            decoration: InputDecoration(labelText: intl(context).mailAddress),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.mail_outline),
              label: Text(intl(context).sendEmailForPasswordReset),
              onPressed: () {
                ref.read(passwordResetViewModelProvider).sendPasswordResetMail(emailEditingController.text);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showSentPasswordResetMailDialog(BuildContext context) async {
    await SimpleMessageDialog(context, title: intl(context).confirm, message: intl(context).sentEmailForPasswordReset, positiveButton: intl(context).close).show();
    Navigator.of(context).pop();
  }
}
