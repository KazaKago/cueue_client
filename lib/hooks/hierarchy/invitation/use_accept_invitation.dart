import 'package:cueue/api/response/user/user_response.dart';
import 'package:cueue/hooks/global/swr/swr_cache.dart';
import 'package:cueue/hooks/global/swr/swr_system_cache.dart';
import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_easy_loading.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/legacy/data/cache/di/cache_provider.dart';
import 'package:cueue/model/invitation/invitation_code.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog_event.dart';
import 'package:cueue/ui/hierarchy/splash/splash_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<InvitationCode, UserResponse> useAcceptInvitation(WidgetRef ref) {
  final acceptInvitationApi = ref.read(acceptInvitationApiProvider);
  final cacheList = ref.read(allCacheProvider);
  final intl = useIntl();
  final showErrorDialog = useShowErrorDialog(ref);
  final showSimpleMessageDialog = useShowSimpleMessageDialog();
  final replacePage = useReplacePage();
  final easyLoading = useEasyLoading();
  final acceptInvitation = useSWRTrigger<InvitationCode, UserResponse>((code) async {
    return acceptInvitationApi(code.value);
  });
  useEffectSWRData<SimpleMessageDialogEvent?>(showSimpleMessageDialog, (_) {
    swrCache.clear();
    swrSystemCache.clear();
    for (final cache in cacheList) {
      cache.clearAll();
    }
    replacePage.trigger(const SplashPage());
  });
  useEffectSWRData(acceptInvitation, (_) {
    showSimpleMessageDialog.trigger(
      SimpleMessageDialogData(
        title: intl.info,
        message: intl.successToJoinWorkspace,
        positiveButton: intl.confirm,
      ),
    );
  });
  useEffectSWRIsMutating(acceptInvitation, (isMutating) {
    easyLoading.trigger(isMutating);
  });
  useEffectSWRError(acceptInvitation, (error) {
    showErrorDialog.trigger(error);
  });
  return acceptInvitation;
}
