import 'package:cueue/domain/model/hierarchy/invitation/invitation_code.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/hierarchy/invitation/invitation_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InvitationInputPage extends HookConsumerWidget {
  const InvitationInputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final textEditingController = useTextEditingController();
    final isEnableRegistrationButton = useState(false);
    textEditingController.addListener(() {
      isEnableRegistrationButton.value = textEditingController.text.isNotEmpty;
    });
    return Scaffold(
      appBar: AppBar(title: Text(intl(context).inputInvitationCode)),
      body: Scrollbar(
        controller: scrollController,
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.all(32),
          children: [
            SelectableText(textAlign: TextAlign.center, intl(context).pleaseInputInvitationCode),
            const SizedBox(height: 32),
            TextField(
              controller: textEditingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: intl(context).invitationCode, alignLabelWithHint: true, border: const OutlineInputBorder()),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: isEnableRegistrationButton.value ? () => _pushInvitationInfo(context, textEditingController.text) : null,
              child: Text(intl(context).confirmInvitationCode),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pushInvitationInfo(BuildContext context, String code) async {
    final invitationCode = InvitationCode(code);
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => InvitationInfoPage(invitationCode)));
  }
}
