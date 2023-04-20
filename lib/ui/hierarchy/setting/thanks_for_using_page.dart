import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:cueue/ui/hierarchy/auth/authentication_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ThanksForUsingPage extends HookWidget {
  const ThanksForUsingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final intl = useIntl();
    final replacePage = useReplacePage();
    final scrollController = useScrollController();
    return Scaffold(
      appBar: AppBar(title: Text(intl.accountDeletion)),
      body: Scrollbar(
        controller: scrollController,
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.all(32),
          children: [
            Assets.images.icAppIcon.image(width: 128, height: 128),
            const SizedBox(height: 32),
            Text(textAlign: TextAlign.center, intl.thanksForUsingMessage),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => replacePage.trigger(const AuthenticationPage()),
              child: Text(intl.backToLoginScreen),
            ),
          ],
        ),
      ),
    );
  }
}
