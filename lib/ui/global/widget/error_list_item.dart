import 'package:cueue/legacy/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorListItem extends HookConsumerWidget {
  const ErrorListItem(
    this._exception, {
    required void Function() onClickRetry,
    super.key,
  }) : _onClickRetry = onClickRetry;

  final Exception _exception;
  final void Function() _onClickRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = useIntl();
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
            child: Text(intl.retry),
          ),
        ],
      ),
    );
  }
}
