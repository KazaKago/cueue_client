import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorListItem extends ConsumerWidget {
  const ErrorListItem(this._exception, {required final void Function() onClickRetry, final Key? key})
      : _onClickRetry = onClickRetry,
        super(key: key);

  final Exception _exception;
  final void Function() _onClickRetry;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text(
            const ExceptionHandler().getMessage(context, ref, _exception, withSystemMessage: false),
            textAlign: TextAlign.center,
            style: const TextStyle(height: 1.3),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: _onClickRetry,
            child: Text(AppLocalizations.of(context)!.retry),
          ),
        ],
      ),
    );
  }
}
