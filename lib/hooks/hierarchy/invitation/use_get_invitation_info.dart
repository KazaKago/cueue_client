import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/swr/use_swr.dart';
import 'package:cueue/model/invitation/invitation.dart';
import 'package:cueue/model/invitation/invitation_code.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

SWRState<String, Invitation> useGetInvitationInfo(WidgetRef ref, InvitationCode code) {
  final getInvitationApi = ref.read(getInvitationApiProvider);
  final invitationResponseMapper = ref.read(invitationResponseMapperProvider);
  return useSWR('invitation_creation_${code.value}', (_) async {
    final response = await getInvitationApi(code.value);
    return invitationResponseMapper(response);
  });
}
