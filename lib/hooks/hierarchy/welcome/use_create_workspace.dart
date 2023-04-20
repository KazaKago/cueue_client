import 'package:cueue/api/request/workspace/workspace_request.dart';
import 'package:cueue/api/response/workspace/workspace_response.dart';
import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_easy_loading.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/ui/hierarchy/main/main_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRTriggerState<String, WorkspaceResponse> useCreateWorkspace(WidgetRef ref) {
  final createWorkspaceApi = ref.read(createWorkspaceApiProvider);
  final showErrorDialog = useShowErrorDialog(ref);
  final replacePage = useReplacePage();
  final easyLoading = useEasyLoading();
  final createWorkspace = useSWRTrigger<String, WorkspaceResponse>((name) {
    return createWorkspaceApi(WorkspaceRequest(name: name));
  });
  useEffectSWRData(createWorkspace, (_) {
    replacePage.trigger(const MainPage());
  });
  useEffectSWRIsMutating(createWorkspace, (isMutating) {
    easyLoading.trigger(isMutating);
  });
  useEffectSWRError(createWorkspace, (error) {
    showErrorDialog.trigger(error);
  });
  return createWorkspace;
}
