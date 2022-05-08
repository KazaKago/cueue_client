import 'package:cueue/domain/model/hierarchy/auth/sign_in_check_result.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authentication_type.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authorizer/apple_authorizer.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authorizer/google_authorizer.dart';
import 'package:cueue/presentation/view/hierarchy/auth/password_reset_page.dart';
import 'package:cueue/presentation/view/hierarchy/auth/sign_in_with_apple_button.dart';
import 'package:cueue/presentation/view/hierarchy/auth/sign_in_with_google_button.dart';
import 'package:cueue/presentation/view/hierarchy/auth/sign_in_with_password_button.dart';
import 'package:cueue/presentation/view/hierarchy/main/main_page.dart';
import 'package:cueue/presentation/view/hierarchy/welcome/workspace_creation_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthenticationPage extends HookConsumerWidget {
  const AuthenticationPage(this.authenticationType, {Key? key}) : super(key: key);

  final AuthenticationType authenticationType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailEditingController = useTextEditingController();
    final passwordEditingController = useTextEditingController();
    final confirmationPasswordEditingController = useTextEditingController();
    final shouldShowReauthenticationWithPassword = ref.watch(authenticationViewModelProvider.select((viewModel) => viewModel.shouldShowReauthenticationWithPassword));
    final shouldShowReauthenticationWithGoogle = ref.watch(authenticationViewModelProvider.select((viewModel) => viewModel.shouldShowReauthenticationWithGoogle));
    final shouldShowReauthenticationWithApple = ref.watch(authenticationViewModelProvider.select((viewModel) => viewModel.shouldShowReauthenticationWithApple));
    final isObscurePasswordText = useState(true);
    final isObscureConfirmationPasswordText = useState(true);
    final viewModel = ref.read(authenticationViewModelProvider);
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
            signUp: () => intl(context).signUp,
            signIn: () => intl(context).signIn,
            reauth: () => intl(context).reAuth,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: <Widget>[
          if (authenticationType != AuthenticationType.reauth)
            TextField(
              enabled: shouldShowReauthenticationWithPassword || authenticationType != AuthenticationType.reauth,
              controller: emailEditingController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: intl(context).mailAddress,
              ),
            ),
          TextField(
            enabled: shouldShowReauthenticationWithPassword || authenticationType != AuthenticationType.reauth,
            controller: passwordEditingController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: isObscurePasswordText.value,
            decoration: InputDecoration(
              labelText: intl(context).password,
              suffixIcon: IconButton(
                icon: Icon(isObscurePasswordText.value ? Icons.visibility_off : Icons.visibility),
                onPressed: () => isObscurePasswordText.value = !isObscurePasswordText.value,
              ),
            ),
          ),
          if (authenticationType == AuthenticationType.signUp)
            TextField(
              controller: confirmationPasswordEditingController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: isObscureConfirmationPasswordText.value,
              decoration: InputDecoration(
                labelText: intl(context).reInputPassword,
                suffixIcon: IconButton(
                  icon: Icon(isObscureConfirmationPasswordText.value ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => isObscureConfirmationPasswordText.value = !isObscureConfirmationPasswordText.value,
                ),
              ),
            ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: SignInWithPasswordButton(
              authenticationType: authenticationType,
              enabled: shouldShowReauthenticationWithPassword || authenticationType != AuthenticationType.reauth,
              onSignUp: () => viewModel.signUpWithPassword(emailEditingController.text, passwordEditingController.text, confirmationPasswordEditingController.text),
              onSignIn: () => viewModel.signInWithPassword(emailEditingController.text, passwordEditingController.text),
              onReauth: () => viewModel.reauthorizeWithPassword(passwordEditingController.text),
            ),
          ),
          if (authenticationType != AuthenticationType.signUp) const SizedBox(height: 24),
          if (authenticationType != AuthenticationType.signUp)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (shouldShowReauthenticationWithPassword || authenticationType != AuthenticationType.reauth) ? () => _goPasswordReset(context) : null,
                  child: Text(intl(context).forgotPassword, style: Theme.of(context).textTheme.caption?.copyWith(decoration: TextDecoration.underline)),
                ),
              ],
            ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(intl(context).or),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: SignInWithAppleButton(
              authenticationType: authenticationType,
              enabled: shouldShowReauthenticationWithApple || authenticationType != AuthenticationType.reauth,
              onSignUp: () => _signInWithApple(context, ref),
              onSignIn: () => _signInWithApple(context, ref),
              onReauth: () => _reauthorizeWithApple(context, ref),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: SignInWithGoogleButton(
              authenticationType: authenticationType,
              enabled: shouldShowReauthenticationWithGoogle || authenticationType != AuthenticationType.reauth,
              onSignUp: () => _signInWithGoogle(context, ref),
              onSignIn: () => _signInWithGoogle(context, ref),
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

  Future<void> _goPasswordReset(BuildContext context) async {
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => const PasswordResetPage()));
  }

  R _whenType<R>({required R Function() signUp, required R Function() signIn, required R Function() reauth}) {
    switch (authenticationType) {
      case AuthenticationType.signUp:
        return signUp();
      case AuthenticationType.signIn:
        return signIn();
      case AuthenticationType.reauth:
        return reauth();
    }
  }
}
