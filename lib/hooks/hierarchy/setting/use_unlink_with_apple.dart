import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_easy_loading.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_firebase_user.dart';
import 'package:cueue/model/auth/apple_provider_id.dart';
import 'package:cueue/model/auth/firebase_auth_extension.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:cueue/ui/global/modal/fried_toast.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog_event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<void, void> useUnlinkWithApple(WidgetRef ref) {
  final easyLoading = useEasyLoading();
  final showFriedToast = useShowFriedToast();
  final showErrorDialog = useShowErrorDialog(ref);
  final intl = useIntl();
  final showUnlinkWithAppleConfirmationDialog = useShowSimpleMessageDialog();
  final firebaseUserState = useFirebaseUser(ref);
  final unlinkWithApple = useSWRTrigger<void, bool>((_) async {
    try {
      const providerId = AppleProviderId();
      await firebaseUserState.data?.unlink(providerId.value);
      return true;
    } on FirebaseAuthException catch (exception) {
      throw await exception.parse();
    }
  });
  useEffectSWRData(showUnlinkWithAppleConfirmationDialog, (event) {
    if (event == const SimpleMessageDialogEvent.positive()) unlinkWithApple.trigger(null);
  });
  useEffectSWRData(unlinkWithApple, (_) {
    showFriedToast(intl.unlinkedWithApple);
  });
  useEffectSWRIsMutating(unlinkWithApple, (isMutating) {
    easyLoading.trigger(isMutating);
  });
  useEffectSWRError(unlinkWithApple, (error) {
    showErrorDialog.trigger(error);
  });
  return useSWRTrigger((key) {
    return showUnlinkWithAppleConfirmationDialog.trigger(
      SimpleMessageDialogData(
        title: intl.confirm,
        message: intl.confirmToUnConnectApple,
        positiveButton: intl.unConnect,
        negativeButton: intl.cancel,
      ),
    );
  });
}
