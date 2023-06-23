import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/global/utils/use_theme.dart';
import 'package:cueue/hooks/hierarchy/setting/use_delete_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountDeletionPage extends HookConsumerWidget {
  const AccountDeletionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();
    final intl = useIntl();
    final deleteAccountWithConfirmation = useDeleteAccountWithConfirmation(ref);
    final scrollController = useScrollController();
    return Scaffold(
      appBar: AppBar(title: Text(intl.accountDeletion)),
      body: Scrollbar(
        controller: scrollController,
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.all(32),
          children: [
            Icon(Icons.warning_amber_rounded, size: 96, color: theme.colorScheme.error),
            const SizedBox(height: 32),
            Text(textAlign: TextAlign.center, intl.accountDeletionDescription),
            const SizedBox(height: 32),
            ElevatedButton(
              style: TextButton.styleFrom(backgroundColor: theme.colorScheme.error),
              onPressed: () => deleteAccountWithConfirmation.trigger(true),
              child: Text(intl.approveAndDeletionAccount),
            )
          ],
        ),
      ),
    );
  }
}
