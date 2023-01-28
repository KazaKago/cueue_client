import 'package:cueue/model/exception/require_reautentication_exception.dart';
import 'package:cueue/ui/hierarchy/auth/authentication_page.dart';
import 'package:cueue/ui/hierarchy/auth/reauthentication_dialog.dart';
import 'package:cueue/ui/hierarchy/auth/sign_in_with_apple_button.dart';
import 'package:cueue/ui/hierarchy/auth/sign_in_with_google_button.dart';
import 'package:widgetbook/widgetbook.dart';

final authComponent = WidgetbookComponent(
  name: 'Auth',
  isExpanded: true,
  useCases: [
    WidgetbookUseCase(
      name: 'AuthenticationPage',
      builder: (_) => const AuthenticationPage(),
    ),
    WidgetbookUseCase(
      name: 'ReauthenticationDialog',
      builder: (_) => const ReauthenticationDialog(RequireReauthenticationException(RequireReauthenticationType.deleteAccount())),
    ),
    WidgetbookUseCase(
      name: 'SignInWithAppleButton',
      builder: (_) => SignInWithAppleButton(enabled: true, onAuth: () => {}),
    ),
    WidgetbookUseCase(
      name: 'SignInWithGoogleButton',
      builder: (_) => SignInWithGoogleButton(enabled: true, onAuth: () => {}),
    ),
  ],
);
