import 'package:cueue/domain/model/hierarchy/auth/sign_in_check_result.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authentication_type.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authorizer/apple_authorizer.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authorizer/google_authorizer.dart';
import 'package:cueue/presentation/view/hierarchy/auth/sign_in_with_apple_button.dart';
import 'package:cueue/presentation/view/hierarchy/auth/sign_in_with_google_button.dart';
import 'package:cueue/presentation/view/hierarchy/main/main_page.dart';
import 'package:cueue/presentation/view/hierarchy/welcome/workspace_creation_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthenticationPage extends HookConsumerWidget {
  const AuthenticationPage(this.authenticationType, {super.key});

  final AuthenticationType authenticationType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shouldShowReauthenticationWithGoogle = ref.watch(authenticationViewModelProvider.select((viewModel) => viewModel.shouldShowReauthenticationWithGoogle));
    final shouldShowReauthenticationWithApple = ref.watch(authenticationViewModelProvider.select((viewModel) => viewModel.shouldShowReauthenticationWithApple));
    ref
      ..listen<bool>(authenticationViewModelProvider.select((viewModel) => viewModel.isLoading), (previous, isLoading) {
        isLoading ? EasyLoading.show() : EasyLoading.dismiss();
      })
      ..listen<Event<SignInCheckResult>>(authenticationViewModelProvider.select((viewModel) => viewModel.completionAuthenticationEvent), (previous, completionAuthenticationEvent) {
        completionAuthenticationEvent((event) => _goNextRoute(context, event));
      })
      ..listen<Event<void>>(authenticationViewModelProvider.select((viewModel) => viewModel.completionReauthenticationEvent), (previous, completionReauthenticationEvent) {
        completionReauthenticationEvent((_) => Navigator.of(context).pop(true));
      })
      ..listen<Event<Exception>>(authenticationViewModelProvider.select((viewModel) => viewModel.exceptionEvent), (previous, exceptionEvent) {
        exceptionEvent((exception) => const ExceptionHandler().showMessageDialog(context, ref, exception));
      });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _whenType(
            onAuth: () => intl(context).login,
            onReauth: () => intl(context).reAuth,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: SignInWithAppleButton(
              authenticationType: authenticationType,
              enabled: shouldShowReauthenticationWithApple || authenticationType != AuthenticationType.reauth,
              onAuth: () => _signInWithApple(context, ref),
              onReauth: () => _reauthorizeWithApple(context, ref),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: SignInWithGoogleButton(
              authenticationType: authenticationType,
              enabled: shouldShowReauthenticationWithGoogle || authenticationType != AuthenticationType.reauth,
              onAuth: () => _signInWithGoogle(context, ref),
              onReauth: () => _reauthorizeWithGoogle(context, ref),
            ),
          ),
        ],
      ),
    );
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

  Future<void> _signInWithApple(BuildContext context, WidgetRef ref) async {
    final viewModel = ref.read(authenticationViewModelProvider);
    try {
      final authInfo = await const AppleAuthorizer().authorize(context);
      await viewModel.signInWithApple(authInfo);
    } on Exception catch (exception) {
      await const ExceptionHandler().showMessageDialog(context, ref, exception);
    }
  }

  Future<void> _reauthorizeWithGoogle(BuildContext context, WidgetRef ref) async {
    final viewModel = ref.read(authenticationViewModelProvider);
    try {
      final authInfo = await const GoogleAuthorizer().authorize(context);
      await viewModel.reauthorizeWithGoogle(authInfo);
    } on Exception catch (exception) {
      await const ExceptionHandler().showMessageDialog(context, ref, exception);
    }
  }

  Future<void> _reauthorizeWithApple(BuildContext context, WidgetRef ref) async {
    final viewModel = ref.read(authenticationViewModelProvider);
    try {
      final authInfo = await const AppleAuthorizer().authorize(context);
      await viewModel.reauthorizeWithApple(authInfo);
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

  R _whenType<R>({required R Function() onAuth, required R Function() onReauth}) {
    switch (authenticationType) {
      case AuthenticationType.auth:
        return onAuth();
      case AuthenticationType.reauth:
        return onReauth();
    }
  }
}
