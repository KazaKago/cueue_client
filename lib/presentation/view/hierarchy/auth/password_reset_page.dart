import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/global/modal/simple_message_dialog.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PasswordResetPage extends HookConsumerWidget {
  const PasswordResetPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final emailEditingController = useTextEditingController();
    final userEmail = ref.watch(passwordResetViewModelProvider.select((viewModel) => viewModel.userEmail));
    if (userEmail != null) emailEditingController.text = userEmail.value;
    ref
      ..listen(passwordResetViewModelProvider.select((viewModel) => viewModel.completion), ((final Unit? completion) {
        if (completion != null) _showSentPasswordResetMailDialog(context);
        ref.read(passwordResetViewModelProvider).completion = null;
      }))
      ..listen(passwordResetViewModelProvider.select((viewModel) => viewModel.exception), ((final Exception? exception) {
        if (exception != null) const ExceptionHandler().showMessageDialog(context, ref, exception);
        ref.read(passwordResetViewModelProvider).exception = null;
      }))
      ..listen(passwordResetViewModelProvider.select((viewModel) => viewModel.isLoading), ((final bool isLoading) {
        isLoading ? EasyLoading.show() : EasyLoading.dismiss();
      }));
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.passwordReset),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: <Widget>[
          TextField(
            enabled: emailEditingController.text.isEmpty,
            controller: emailEditingController,
            keyboardType: TextInputType.emailAddress,
            autofocus: emailEditingController.text.isEmpty,
            decoration: InputDecoration(labelText: AppLocalizations.of(context)!.mailAddress),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.mail_outline),
              label: Text(AppLocalizations.of(context)!.sendEmailForPasswordReset),
              onPressed: () {
                ref.read(passwordResetViewModelProvider).sendPasswordResetMail(emailEditingController.text);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showSentPasswordResetMailDialog(final BuildContext context) async {
    await SimpleMessageDialog(context, title: AppLocalizations.of(context)!.confirm, message: AppLocalizations.of(context)!.sentEmailForPasswordReset, positiveButton: AppLocalizations.of(context)!.close).show();
    Navigator.of(context).pop();
  }
}
