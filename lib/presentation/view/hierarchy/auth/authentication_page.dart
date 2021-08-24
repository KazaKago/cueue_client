import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authorizer/apple_authorizer.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authorizer/google_authorizer.dart';
import 'package:cueue/presentation/view/hierarchy/auth/password_reset_page.dart';
import 'package:cueue/presentation/view/hierarchy/main/main_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthenticationPage extends HookConsumerWidget {
  const AuthenticationPage(this.authenticationType, {final Key? key}) : super(key: key);

  final AuthenticationType authenticationType;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final emailEditingController = useTextEditingController();
    final passwordEditingController = useTextEditingController();
    final confirmationPasswordEditingController = useTextEditingController();
    final shouldShowReauthenticationWithPassword = ref.watch(authenticationViewModelProvider.select((viewModel) => viewModel.shouldShowReauthenticationWithPassword));
    final shouldShowReauthenticationWithGoogle = ref.watch(authenticationViewModelProvider.select((viewModel) => viewModel.shouldShowReauthenticationWithGoogle));
    final shouldShowReauthenticationWithApple = ref.watch(authenticationViewModelProvider.select((viewModel) => viewModel.shouldShowReauthenticationWithApple));
    final isObscurePasswordText = useState(true);
    final isObscureConfirmationPasswordText = useState(true);
    ref
      ..listen(authenticationViewModelProvider.select((viewModel) => viewModel.isLoading), ((final bool isLoading) {
        isLoading ? EasyLoading.show() : EasyLoading.dismiss();
      }))
      ..listen(authenticationViewModelProvider.select((viewModel) => viewModel.completionAuthentication), ((final Unit? completionAuthentication) {
        if (completionAuthentication != null) _replaceMainPage(context);
        ref.read(authenticationViewModelProvider).completionAuthentication = null;
      }))
      ..listen(authenticationViewModelProvider.select((viewModel) => viewModel.completionReauthentication), ((final Unit? completionReauthentication) {
        if (completionReauthentication != null) Navigator.of(context).pop(true);
        ref.read(authenticationViewModelProvider).completionReauthentication = null;
      }))
      ..listen(authenticationViewModelProvider.select((viewModel) => viewModel.exception), ((final Exception? exception) {
        if (exception != null) const ExceptionHandler().showMessageDialog(context, ref, exception);
        ref.read(authenticationViewModelProvider).exception = null;
      }));
    return Scaffold(
      appBar: AppBar(
        title: Text(_whenType(signUp: () => AppLocalizations.of(context)!.signUp, signIn: () => AppLocalizations.of(context)!.signIn, reauth: () => AppLocalizations.of(context)!.reAuth)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: <Widget>[
          if (authenticationType != AuthenticationType.reauth)
            TextField(
              enabled: !(!shouldShowReauthenticationWithPassword && authenticationType == AuthenticationType.reauth),
              controller: emailEditingController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.mailAddress,
              ),
            ),
          TextField(
            enabled: !(!shouldShowReauthenticationWithPassword && authenticationType == AuthenticationType.reauth),
            controller: passwordEditingController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: isObscurePasswordText.value,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.password,
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
                labelText: AppLocalizations.of(context)!.reInputPassword,
                suffixIcon: IconButton(
                  icon: Icon(isObscureConfirmationPasswordText.value ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => isObscureConfirmationPasswordText.value = !isObscureConfirmationPasswordText.value,
                ),
              ),
            ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.mail_outline),
              label: Text(_whenType(signUp: () => AppLocalizations.of(context)!.signUpWithPassword, signIn: () => AppLocalizations.of(context)!.signInWithPassword, reauth: () => AppLocalizations.of(context)!.reAuthWithPassword)),
              onPressed: (!shouldShowReauthenticationWithPassword && authenticationType == AuthenticationType.reauth)
                  ? null
                  : () {
                      final viewModel = ref.read(authenticationViewModelProvider);
                      return _whenType(
                        signUp: () => viewModel.signUpWithPassword(emailEditingController.text, passwordEditingController.text, confirmationPasswordEditingController.text),
                        signIn: () => viewModel.signInWithPassword(emailEditingController.text, passwordEditingController.text),
                        reauth: () => viewModel.reauthorizeWithPassword(passwordEditingController.text),
                      );
                    },
            ),
          ),
          if (authenticationType != AuthenticationType.signUp) const SizedBox(height: 24),
          if (authenticationType != AuthenticationType.signUp)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (!shouldShowReauthenticationWithPassword && authenticationType == AuthenticationType.reauth) ? null : () => _goPasswordReset(context),
                  child: Text(AppLocalizations.of(context)!.forgotPassword, style: Theme.of(context).textTheme.caption?.copyWith(decoration: TextDecoration.underline)),
                ),
              ],
            ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.or),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: ElevatedButton.icon(
              icon: const Icon(FontAwesomeIcons.google),
              label: Text(AppLocalizations.of(context)!.withGoogleAccount(_whenType(
                signUp: () => AppLocalizations.of(context)!.auth,
                signIn: () => AppLocalizations.of(context)!.auth,
                reauth: () => AppLocalizations.of(context)!.reAuth,
              ))),
              onPressed: (!shouldShowReauthenticationWithGoogle && authenticationType == AuthenticationType.reauth)
                  ? null
                  : () {
                      return _whenType(
                        signUp: () => _signInWithGoogle(context, ref),
                        signIn: () => _signInWithGoogle(context, ref),
                        reauth: () => _reauthorizeWithGoogle(context, ref),
                      );
                    },
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: ElevatedButton.icon(
              icon: const Icon(FontAwesomeIcons.apple),
              label: Text(AppLocalizations.of(context)!.withAppleAccount(_whenType(
                signUp: () => AppLocalizations.of(context)!.auth,
                signIn: () => AppLocalizations.of(context)!.auth,
                reauth: () => AppLocalizations.of(context)!.reAuth,
              ))),
              onPressed: (!shouldShowReauthenticationWithApple && authenticationType == AuthenticationType.reauth)
                  ? null
                  : () {
                      return _whenType(
                        signUp: () => _signInWithApple(context, ref),
                        signIn: () => _signInWithApple(context, ref),
                        reauth: () => _reauthorizeWithApple(context, ref),
                      );
                    },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _signInWithGoogle(final BuildContext context, final WidgetRef ref) async {
    final viewModel = ref.read(authenticationViewModelProvider);
    try {
      final authInfo = await const GoogleAuthorizer().authorize(context);
      await viewModel.signInWithGoogle(authInfo);
    } on Exception catch (exception) {
      await const ExceptionHandler().showMessageDialog(context, ref, exception);
    }
  }

  Future<void> _signInWithApple(final BuildContext context, final WidgetRef ref) async {
    final viewModel = ref.read(authenticationViewModelProvider);
    try {
      final authInfo = await const AppleAuthorizer().authorize(context);
      await viewModel.signInWithApple(authInfo);
    } on Exception catch (exception) {
      await const ExceptionHandler().showMessageDialog(context, ref, exception);
    }
  }

  Future<void> _reauthorizeWithGoogle(final BuildContext context, final WidgetRef ref) async {
    final viewModel = ref.read(authenticationViewModelProvider);
    try {
      final authInfo = await const GoogleAuthorizer().authorize(context);
      await viewModel.reauthorizeWithGoogle(authInfo);
    } on Exception catch (exception) {
      await const ExceptionHandler().showMessageDialog(context, ref, exception);
    }
  }

  Future<void> _reauthorizeWithApple(final BuildContext context, final WidgetRef ref) async {
    final viewModel = ref.read(authenticationViewModelProvider);
    try {
      final authInfo = await const AppleAuthorizer().authorize(context);
      await viewModel.reauthorizeWithApple(authInfo);
    } on Exception catch (exception) {
      await const ExceptionHandler().showMessageDialog(context, ref, exception);
    }
  }

  Future<void> _replaceMainPage(final BuildContext context) async {
    await Navigator.pushAndRemoveUntil<void>(context, MaterialPageRoute(builder: (context) => const MainPage()), (route) => false);
  }

  Future<void> _goPasswordReset(final BuildContext context) async {
    await Navigator.push<void>(context, MaterialPageRoute(builder: (context) => const PasswordResetPage()));
  }

  R _whenType<R>({
    required final R Function() signUp,
    required final R Function() signIn,
    required final R Function() reauth,
  }) {
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

enum AuthenticationType {
  signUp,
  signIn,
  reauth,
}
