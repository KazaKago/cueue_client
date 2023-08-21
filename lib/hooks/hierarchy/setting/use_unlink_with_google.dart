import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/global/utils/use_overlay_loading.dart';
import 'package:cueue/hooks/global/utils/use_overlay_toast.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_firebase_user.dart';
import 'package:cueue/model/auth/firebase_auth_extension.dart';
import 'package:cueue/model/auth/google_provider_id.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog_event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<void, void> useUnlinkWithGoogle(WidgetRef ref) {
  final overlayLoading = useOverlayLoading();
  final overlayToast = useOverlayToast();
  final showErrorDialog = useShowErrorDialog(ref);
  final intl = useIntl();
  final showUnlinkWithGoogleConfirmationDialog = useShowSimpleMessageDialog();
  final firebaseUserState = useFirebaseUser(ref);
  final unlinkWithGoogle = useSWRTrigger<void, bool>((_) async {
    try {
      const providerId = GoogleProviderId();
      await firebaseUserState.data?.unlink(providerId.value);
      return true;
    } on FirebaseAuthException catch (exception) {
      throw await exception.parse();
    }
  });
  useEffectSWRData(showUnlinkWithGoogleConfirmationDialog, (event) {
    if (event == const SimpleMessageDialogEvent.positive()) unlinkWithGoogle.trigger(null);
  });
  useEffectSWRData(unlinkWithGoogle, (_) {
    overlayToast(intl.unlinkedWithGoogle);
  });
  useEffectSWRIsMutating(unlinkWithGoogle, ({required isMutating}) {
    overlayLoading.trigger(isMutating);
  });
  useEffectSWRError(unlinkWithGoogle, (error) {
    showErrorDialog.trigger(error);
  });
  return useSWRTrigger((key) {
    return showUnlinkWithGoogleConfirmationDialog.trigger(
      SimpleMessageDialogData(
        title: intl.confirm,
        message: intl.confirmToUnConnectGoogle,
        positiveButton: intl.unConnect,
        negativeButton: intl.cancel,
      ),
    );
  });
}
