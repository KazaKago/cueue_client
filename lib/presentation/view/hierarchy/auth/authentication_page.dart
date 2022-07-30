import 'package:cueue/domain/model/hierarchy/auth/sign_in_check_result.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authorizer/apple_authorizer.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authorizer/google_authorizer.dart';
import 'package:cueue/presentation/view/hierarchy/auth/sign_in_with_apple_button.dart';
import 'package:cueue/presentation/view/hierarchy/auth/sign_in_with_google_button.dart';
import 'package:cueue/presentation/view/hierarchy/main/main_page.dart';
import 'package:cueue/presentation/view/hierarchy/setting/about_page.dart';
import 'package:cueue/presentation/view/hierarchy/setting/privacy_policy_url.dart';
import 'package:cueue/presentation/view/hierarchy/setting/terms_of_service_url.dart';
import 'package:cueue/presentation/view/hierarchy/welcome/workspace_creation_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthenticationPage extends HookConsumerWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
      ..listen<bool>(authenticationViewModelProvider.select((viewModel) => viewModel.isLoading), (previous, isLoading) {
        isLoading ? EasyLoading.show() : EasyLoading.dismiss();
      })
      ..listen<Event<SignInCheckResult>>(authenticationViewModelProvider.select((viewModel) => viewModel.completionAuthenticationEvent), (previous, completionAuthenticationEvent) {
        completionAuthenticationEvent((event) => _goNextRoute(context, event));
      })
      ..listen<Event<Exception>>(authenticationViewModelProvider.select((viewModel) => viewModel.exceptionEvent), (previous, exceptionEvent) {
        exceptionEvent((exception) => const ExceptionHandler().showMessageDialog(context, ref, exception));
      });
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
                  child: SignInWithAppleButton(
                    enabled: true,
                    onAuth: () => _signInWithApple(context, ref),
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
                    onAuth: () => _signInWithGoogle(context, ref),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signInWithApple(BuildContext context, WidgetRef ref) async {
    final viewModel = ref.read(authenticationViewModelProvider);
    try {
      final authInfo = await const AppleAuthorizer().authorize(context);
      await viewModel.signInWithApple(authInfo);
    } on Exception catch (exception) {
      await const ExceptionHandler().showMessageDialog(context, ref, exception);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context, WidgetRef ref) async {
    final viewModel = ref.read(authenticationViewModelProvider);
    try {
      final authInfo = await const GoogleAuthorizer().authorize(context);
      await viewModel.signInWithGoogle(authInfo);
    } on Exception catch (exception) {
      await const ExceptionHandler().showMessageDialog(context, ref, exception);
    }
  }

  Future<void> _goNextRoute(BuildContext context, SignInCheckResult signInCheckResult) async {
    Widget page;
    switch (signInCheckResult) {
      case SignInCheckResult.workspaceCreation:
        page = const WorkspaceCreationPage();
        break;
      case SignInCheckResult.afterSignIn:
        page = const MainPage();
        break;
    }
    await Navigator.pushAndRemoveUntil<void>(context, MaterialPageRoute(builder: (context) => page), (route) => false);
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
