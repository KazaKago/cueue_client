import 'package:cueue/api/response/user/user_response.dart';
import 'package:cueue/hooks/global/swr/swr_cache.dart';
import 'package:cueue/hooks/global/swr/swr_system_cache.dart';
import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/global/utils/use_overlay_loading.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/model/invitation/invitation_code.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog.dart';
import 'package:cueue/ui/global/modal/simple_message_dialog_event.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<InvitationCode, UserResponse> useAcceptInvitation(WidgetRef ref) {
  final acceptInvitationApi = ref.read(acceptInvitationApiProvider);
  final intl = useIntl();
  final showErrorDialog = useShowErrorDialog(ref);
  final showSimpleMessageDialog = useShowSimpleMessageDialog();
  final goNamed = useGoNamed();
  final overlayLoading = useOverlayLoading();
  final acceptInvitation = useSWRTrigger<InvitationCode, UserResponse>((code) async {
    return acceptInvitationApi(code.value);
  });
  useEffectSWRData<SimpleMessageDialogEvent?>(showSimpleMessageDialog, (_) {
    swrCache.clear();
    swrSystemCache.clear();
    goNamed.trigger(GoName('root'));
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
  useEffectSWRIsMutating(acceptInvitation, ({required isMutating}) {
    overlayLoading.trigger(isMutating);
  });
  useEffectSWRError(acceptInvitation, (error) {
    showErrorDialog.trigger(error);
  });
  return acceptInvitation;
}
