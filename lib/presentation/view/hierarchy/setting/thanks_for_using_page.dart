import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/hierarchy/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThanksForUsingPage extends HookConsumerWidget {
  const ThanksForUsingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(intl(context).accountDeletion)),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Assets.images.icAppIcon.image(width: 128, height: 128),
                  const SizedBox(height: 32),
                  SelectableText(textAlign: TextAlign.center, intl(context).thanksForUsingMessage),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => _replaceWelcomePage(context),
                    child: Text(intl(context).backToLoginScreen),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _replaceWelcomePage(BuildContext context) async {
    await Navigator.pushAndRemoveUntil<void>(context, MaterialPageRoute(builder: (context) => const WelcomePage()), (route) => false);
  }
}
