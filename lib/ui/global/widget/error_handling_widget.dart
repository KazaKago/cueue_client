import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorHandlingWidget extends HookConsumerWidget {
  const ErrorHandlingWidget(
    this._exception, {
    void Function()? onClickRetry,
    super.key,
  }) : _onClickRetry = onClickRetry;

  final Exception _exception;
  final void Function()? _onClickRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = useIntl();
    final getErrorMessage = useGetErrorMessage(ref);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              getErrorMessage(_exception),
              textAlign: TextAlign.center,
              style: const TextStyle(height: 1.3),
            ),
            const SizedBox(height: 16),
            if (_onClickRetry != null)
              OutlinedButton(
                onPressed: _onClickRetry,
                child: Text(intl.retry),
              ),
          ],
        ),
      ),
    );
  }
}
