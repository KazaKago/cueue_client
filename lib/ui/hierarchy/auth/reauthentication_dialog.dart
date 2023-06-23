import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/hierarchy/auth/use_is_apple_linked.dart';
import 'package:cueue/hooks/hierarchy/auth/use_is_google_linked.dart';
import 'package:cueue/hooks/hierarchy/auth/use_reauthentication_with_apple.dart';
import 'package:cueue/hooks/hierarchy/auth/use_reauthentication_with_google.dart';
import 'package:cueue/model/exception/require_reautentication_exception.dart';
import 'package:cueue/ui/hierarchy/auth/sign_in_with_apple_button.dart';
import 'package:cueue/ui/hierarchy/auth/sign_in_with_google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<RequireReauthenticationException, void> useReauthenticationDialog() {
  final context = useContext();
  return useSWRTrigger((exception) {
    return showDialog(context: context, builder: (context) => ReauthenticationDialog(exception));
  });
}

class ReauthenticationDialog extends HookConsumerWidget {
  const ReauthenticationDialog(this.exception, {super.key});

  final RequireReauthenticationException exception;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = useIntl();
    final isGoogleLinked = useIsGoogleLinked(ref);
    final isAppleLinked = useIsAppleLinked(ref);
    final reauthenticationWithGoogle = useReauthenticationWithGoogle(ref, exception);
    final reauthenticationWithApple = useReauthenticationWithApple(ref, exception);
    return AlertDialog(
      title: Text(intl.needReAuthToContinue),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: SignInWithAppleButton(
              enabled: isAppleLinked,
              onAuth: () => reauthenticationWithApple.trigger(null),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: SignInWithGoogleButton(
              enabled: isGoogleLinked,
              onAuth: () => reauthenticationWithGoogle.trigger(null),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(intl.cancel),
        ),
      ],
    );
  }
}
