import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorHandlingWidget extends ConsumerWidget {
  const ErrorHandlingWidget(this._exception, {void Function()? onClickRetry, Key? key})
      : _onClickRetry = onClickRetry,
        super(key: key);

  final Exception _exception;
  final void Function()? _onClickRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              const ExceptionHandler().getMessage(context, ref, _exception),
              textAlign: TextAlign.center,
              style: const TextStyle(height: 1.3),
            ),
            const SizedBox(height: 16),
            if (_onClickRetry != null)
              OutlinedButton(
                onPressed: _onClickRetry,
                child: Text(intl(context).retry),
              ),
          ],
        ),
      ),
    );
  }
}
