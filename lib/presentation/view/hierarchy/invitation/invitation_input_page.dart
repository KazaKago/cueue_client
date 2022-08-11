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
    final code = useState('');
    final scrollController = useScrollController();
    final textEditingController = useTextEditingController();
    textEditingController.addListener(() {
      code.value = textEditingController.text;
    });
    return Scaffold(
      appBar: AppBar(title: Text(intl(context).inputInvitationCode)),
      body: Scrollbar(
        controller: scrollController,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SelectableText(textAlign: TextAlign.center, intl(context).pleaseInputInvitationCode),
                  const SizedBox(height: 32),
                  TextField(
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: intl(context).invitationCode, alignLabelWithHint: true, border: const OutlineInputBorder()),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: code.value.isNotEmpty ? () => _pushInvitationInfo(context, code.value) : null,
                    child: Text(intl(context).confirmInvitationCode),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pushInvitationInfo(BuildContext context, String code) async {
    final invitationCode = InvitationCode(code);
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => InvitationInfoPage(invitationCode)));
  }
}
