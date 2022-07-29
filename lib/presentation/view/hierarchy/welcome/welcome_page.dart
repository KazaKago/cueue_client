import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authentication_page.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authentication_type.dart';
import 'package:cueue/presentation/view/hierarchy/setting/about_page.dart';
import 'package:cueue/presentation/view/hierarchy/setting/privacy_policy_url.dart';
import 'package:cueue/presentation/view/hierarchy/setting/terms_of_service_url.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomePage extends HookConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(icon: const Icon(Icons.info_outline), onPressed: () => _goAbout(context)),
                ],
              ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: _goTermsOfService,
                    child: Text(intl(context).termsOfService, style: const TextStyle(decoration: TextDecoration.underline)),
                  ),
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: _goPrivacyPolicy,
                    child: Text(intl(context).privacyPolicy, style: const TextStyle(decoration: TextDecoration.underline)),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                  child: ElevatedButton(
                    onPressed: () => _goSignUp(context),
                    child: Text(intl(context).registerAndStart),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                  child: OutlinedButton(
                    onPressed: () => _goSignIn(context),
                    child: Text(intl(context).loginAndContinue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _goSignUp(BuildContext context) async {
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => const AuthenticationPage(AuthenticationType.auth)));
  }

  Future<void> _goSignIn(BuildContext context) async {
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => const AuthenticationPage(AuthenticationType.auth)));
  }

  Future<void> _goTermsOfService() async {
    await launchUrl(termsOfServiceUrl);
  }

  Future<void> _goPrivacyPolicy() async {
    await launchUrl(privacyPolicyUrl);
  }

  Future<void> _goAbout(BuildContext context) async {
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => const AboutPage()));
  }
}
