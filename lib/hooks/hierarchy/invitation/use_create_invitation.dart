import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_immutable.dart';
import 'package:cueue/model/invitation/invitation.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRState<String, Invitation> useCreateInvitation(WidgetRef ref) {
  final createInvitationApi = ref.read(createInvitationApiProvider);
  final invitationResponseMapper = ref.read(invitationResponseMapperProvider);
  final key = useMemoized(() => 'invitation_creation_${DateTime.now().millisecondsSinceEpoch}', []);
  return useSWRImmutable(key, (_) async {
    final response = await createInvitationApi();
    return invitationResponseMapper(response);
  });
}
