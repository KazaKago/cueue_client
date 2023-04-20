import 'package:cueue/hooks/global/swr/swr_cache.dart';
import 'package:cueue/hooks/global/swr/swr_system_cache.dart';
import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/legacy/data/cache/di/cache_provider.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog_event.dart';
import 'package:cueue/ui/hierarchy/auth/authentication_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<void, bool> useSignOut(WidgetRef ref) {
  final cacheList = ref.read(allCacheProvider);
  final replacePage = useReplacePage();
  final signOut = useSWRTrigger((_) async {
    await FirebaseAuth.instance.signOut();
    final googleSignIn = GoogleSignIn();
    if (await googleSignIn.isSignedIn()) await googleSignIn.signOut();
    swrCache.clear();
    swrSystemCache.clear();
    for (final cache in cacheList) {
      cache.clearAll();
    }
    return true;
  });
  useEffectSWRData(signOut, (data) {
    replacePage.trigger(const AuthenticationPage());
  });
  return signOut;
}

SWRTriggerState<void, void> useSignOutWithConfirmation(WidgetRef ref) {
  final intl = useIntl();
  final showSimpleMessageDialog = useShowSimpleMessageDialog();
  final signOut = useSignOut(ref);
  useEffectSWRData<SimpleMessageDialogEvent?>(showSimpleMessageDialog, (event) {
    event?.maybeWhen(
      positive: () => signOut.trigger(null),
      orElse: () {},
    );
  });
  return useSWRTrigger((_) {
    return showSimpleMessageDialog.trigger(
      SimpleMessageDialogData(
        title: intl.confirm,
        message: intl.confirmLogout,
        positiveButton: intl.logout,
        negativeButton: intl.cancel,
      ),
    );
  });
}
