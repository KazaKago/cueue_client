import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authentication_page.dart';
import 'package:cueue/presentation/view/hierarchy/setting/about_page.dart';
import 'package:cueue/presentation/view/hierarchy/setting/privacy_policy_url.dart';
import 'package:cueue/presentation/view/hierarchy/setting/terms_of_service_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomePage extends HookConsumerWidget {
  const WelcomePage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
                    Text(AppLocalizations.of(context)!.appName, style: const TextStyle(fontSize: 60)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: _goTermsOfService,
                    child: Text(AppLocalizations.of(context)!.termsOfService, style: const TextStyle(decoration: TextDecoration.underline)),
                  ),
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: _goPrivacyPolicy,
                    child: Text(AppLocalizations.of(context)!.privacyPolicy, style: const TextStyle(decoration: TextDecoration.underline)),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                  child: ElevatedButton(
                    onPressed: () => _goSignUp(context),
                    child: Text(AppLocalizations.of(context)!.registerAndStart),
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
                    child: Text(AppLocalizations.of(context)!.loginAndContinue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _goSignUp(final BuildContext context) async {
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => const AuthenticationPage(AuthenticationType.signUp)));
  }

  Future<void> _goSignIn(final BuildContext context) async {
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => const AuthenticationPage(AuthenticationType.signIn)));
  }

  Future<void> _goTermsOfService() async {
    await launch(termsOfServiceUrl.toString());
  }

  Future<void> _goPrivacyPolicy() async {
    await launch(privacyPolicyUrl.toString());
  }

  Future<void> _goAbout(final BuildContext context) async {
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => const AboutPage()));
  }
}
