import 'package:cueue/model/invitation/invitation_code.dart';
import 'package:cueue/ui/hierarchy/invitation/invitation_creation_page.dart';
import 'package:cueue/ui/hierarchy/invitation/invitation_info_page.dart';
import 'package:cueue/ui/hierarchy/invitation/invitation_input_page.dart';
import 'package:widgetbook/widgetbook.dart';

final invitationComponent = WidgetbookComponent(
  name: 'Invitation',
  isExpanded: true,
  useCases: [
    WidgetbookUseCase(
      name: 'InvitationCreationPage',
      builder: (_) => const InvitationCreationPage(),
    ),
    WidgetbookUseCase(
      name: 'InvitationInfoPage',
      builder: (_) => const InvitationInfoPage(InvitationCode('code')),
    ),
    WidgetbookUseCase(
      name: 'InvitationInputPage',
      builder: (_) => const InvitationInputPage(),
    ),
  ],
);
