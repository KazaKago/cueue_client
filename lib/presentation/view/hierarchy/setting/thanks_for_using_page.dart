import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/hierarchy/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThanksForUsingPage extends HookConsumerWidget {
  const ThanksForUsingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    return Scaffold(
      appBar: AppBar(title: Text(intl(context).accountDeletion)),
      body: Scrollbar(
        controller: scrollController,
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.all(32),
          children: [
            Assets.images.icAppIcon.image(width: 128, height: 128),
            const SizedBox(height: 32),
            SelectableText(textAlign: TextAlign.center, intl(context).thanksForUsingMessage),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => _replaceSplashPage(context),
              child: Text(intl(context).backToLoginScreen),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _replaceSplashPage(BuildContext context) async {
    await Navigator.pushAndRemoveUntil<void>(context, MaterialPageRoute(builder: (context) => const SplashPage()), (route) => false);
  }
}
