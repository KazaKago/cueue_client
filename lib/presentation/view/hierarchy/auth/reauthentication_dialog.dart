import 'package:cueue/domain/model/global/exception/require_reautentication_exception.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authorizer/apple_authorizer.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authorizer/google_authorizer.dart';
import 'package:cueue/presentation/view/hierarchy/auth/sign_in_with_apple_button.dart';
import 'package:cueue/presentation/view/hierarchy/auth/sign_in_with_google_button.dart';
import 'package:cueue/presentation/view/hierarchy/setting/thanks_for_using_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReauthenticationDialog extends HookConsumerWidget {
  const ReauthenticationDialog(this._exception, {super.key});

  final RequireReauthenticationException _exception;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shouldShowReauthenticationWithGoogle = ref.watch(authenticationViewModelProvider.select((viewModel) => viewModel.shouldShowReauthenticationWithGoogle));
    final shouldShowReauthenticationWithApple = ref.watch(authenticationViewModelProvider.select((viewModel) => viewModel.shouldShowReauthenticationWithApple));
    ref
      ..listen<bool>(authenticationViewModelProvider.select((viewModel) => viewModel.isLoading), (previous, isLoading) {
        isLoading ? EasyLoading.show() : EasyLoading.dismiss();
      })
      ..listen<Event<RequireReauthenticationException>>(authenticationViewModelProvider.select((viewModel) => viewModel.completionReauthenticationEvent), (previous, completionReauthenticationEvent) {
        completionReauthenticationEvent((exception) async => _goNextRoute(context, exception));
      })
      ..listen<Event<Exception>>(authenticationViewModelProvider.select((viewModel) => viewModel.exceptionEvent), (previous, exceptionEvent) {
        exceptionEvent((exception) => const ExceptionHandler().showMessageDialog(context, ref, exception));
      });
    return AlertDialog(
      title: Text(intl(context).needReAuthToContinue),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: SignInWithAppleButton(
              enabled: shouldShowReauthenticationWithApple,
              onAuth: () => _reauthorizeWithApple(context, ref),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: SignInWithGoogleButton(
              enabled: shouldShowReauthenticationWithGoogle,
              onAuth: () => _reauthorizeWithGoogle(context, ref),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(intl(context).cancel),
        ),
      ],
    );
  }

  Future<void> _reauthorizeWithApple(BuildContext context, WidgetRef ref) async {
    final viewModel = ref.read(authenticationViewModelProvider);
    try {
      final authInfo = await const AppleAuthorizer().authorize(context);
      await viewModel.reauthorizeWithApple(authInfo, _exception);
    } on Exception catch (exception) {
      await const ExceptionHandler().showMessageDialog(context, ref, exception);
    }
  }

  Future<void> _reauthorizeWithGoogle(BuildContext context, WidgetRef ref) async {
    final viewModel = ref.read(authenticationViewModelProvider);
    try {
      final authInfo = await const GoogleAuthorizer().authorize(context);
      await viewModel.reauthorizeWithGoogle(authInfo, _exception);
    } on Exception catch (exception) {
      await const ExceptionHandler().showMessageDialog(context, ref, exception);
    }
  }

  Future<void> _goNextRoute(BuildContext context, RequireReauthenticationException exception) async {
    await exception.type.when(
      deleteAccount: () async {
        await Navigator.pushAndRemoveUntil<void>(context, MaterialPageRoute(builder: (context) => const ThanksForUsingPage()), (_) => false);
      },
    );
  }
}
