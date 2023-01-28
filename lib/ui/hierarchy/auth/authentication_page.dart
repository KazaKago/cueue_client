import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/hooks/global/utils/use_route.dart';
import 'package:cueue/hooks/hierarchy/auth/use_sign_in_with_apple.dart';
import 'package:cueue/hooks/hierarchy/auth/use_sign_in_with_google.dart';
import 'package:cueue/hooks/hierarchy/setting/use_go_privacy_policy.dart';
import 'package:cueue/hooks/hierarchy/setting/use_go_terms_of_service.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:cueue/ui/hierarchy/auth/sign_in_with_apple_button.dart';
import 'package:cueue/ui/hierarchy/auth/sign_in_with_google_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthenticationPage extends HookConsumerWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = useIntl();
    final goPrivacyPolicy = useGoPrivacyPolicy();
    final goTermsOfService = useGoTermsOfService();
    final signInWithApple = useSignInWithApple(ref);
    final signInWithGoogle = useSignInWithGoogle(ref);
    final pushAbout = usePushAboutPage();
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(icon: const Icon(Icons.info_outline), onPressed: () => pushAbout.trigger(null)),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Assets.images.icAppIcon.image(width: 256, height: 256),
                    const SizedBox(height: 12),
                    Text(intl.appName, style: const TextStyle(fontSize: 60)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () => goTermsOfService.trigger(null),
                    child: Text(intl.termsOfService, style: const TextStyle(decoration: TextDecoration.underline)),
                  ),
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: () => goPrivacyPolicy.trigger(null),
                    child: Text(intl.privacyPolicy, style: const TextStyle(decoration: TextDecoration.underline)),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                  child: SignInWithAppleButton(
                    enabled: true,
                    onAuth: () => signInWithApple.trigger(null),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                  child: SignInWithGoogleButton(
                    enabled: true,
                    onAuth: () => signInWithGoogle.trigger(null),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
