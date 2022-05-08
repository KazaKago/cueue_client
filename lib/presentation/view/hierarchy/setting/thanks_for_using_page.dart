import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/hierarchy/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThanksForUsingPage extends HookConsumerWidget {
  const ThanksForUsingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Assets.images.icAppIcon.image(width: 256, height: 256),
                    const SizedBox(height: 12),
                    Text(intl(context).appName, style: const TextStyle(fontSize: 60)),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                  child: ElevatedButton(
                    onPressed: () => _replaceWelcomePage(context),
                    child: Text(intl(context).registerAndStart),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _replaceWelcomePage(BuildContext context) async {
    await Navigator.pushAndRemoveUntil<void>(context, MaterialPageRoute(builder: (context) => const WelcomePage()), (route) => false);
  }
}
