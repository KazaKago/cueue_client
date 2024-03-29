import 'package:cueue/hooks/global/swr/swr_cache.dart';
import 'package:cueue/hooks/global/swr/swr_system_cache.dart';
import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/global/utils/use_overlay_loading.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_firebase_user.dart';
import 'package:cueue/model/auth/firebase_auth_extension.dart';
import 'package:cueue/model/exception/require_reautentication_exception.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog_event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<void, void> useDeleteAccount(WidgetRef ref) {
  final showSimpleMessageDialog = useShowSimpleMessageDialog();
  final goNamed = useGoNamed();
  final showErrorDialog = useShowErrorDialog(ref);
  final overlayLoading = useOverlayLoading();
  final firebaseUserState = useFirebaseUser(ref);
  final deleteAccount = useSWRTrigger<void, bool>((_) async {
    try {
      await firebaseUserState.data?.delete();
      final googleSignIn = GoogleSignIn();
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.signOut();
      }
      swrCache.clear();
      swrSystemCache.clear();
    } on FirebaseAuthException catch (exception) {
      throw await exception.parse(requireReauthenticationType: const RequireReauthenticationType.deleteAccount());
    }
    return true;
  });
  useEffectSWRData(showSimpleMessageDialog, (data) {
    if (showSimpleMessageDialog.data != const SimpleMessageDialogEvent.positive()) return;
    deleteAccount.trigger(null);
  });
  useEffectSWRIsMutating(deleteAccount, ({required isMutating}) {
    overlayLoading.trigger(isMutating);
  });
  useEffectSWRData(deleteAccount, (_) {
    goNamed.trigger(GoName('thanks_for_using'));
  });
  useEffectSWRError(deleteAccount, (error) {
    showErrorDialog.trigger(error);
  });
  return deleteAccount;
}

SWRTriggerState<void, void> useDeleteAccountWithConfirmation(WidgetRef ref) {
  final intl = useIntl();
  final showSimpleMessageDialog = useShowSimpleMessageDialog();
  final deleteAccount = useDeleteAccount(ref);
  useEffectSWRData(showSimpleMessageDialog, (data) {
    if (showSimpleMessageDialog.data == const SimpleMessageDialogEvent.positive()) deleteAccount.trigger(null);
  });
  return useSWRTrigger((_) {
    return showSimpleMessageDialog.trigger(
      SimpleMessageDialogData(
        title: intl.warning,
        message: intl.accountDeletionConfirmation,
        positiveButton: intl.doDelete,
        negativeButton: intl.cancel,
      ),
    );
  });
}
