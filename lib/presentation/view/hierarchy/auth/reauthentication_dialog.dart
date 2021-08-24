import 'package:cueue/domain/model/global/exception/require_reautentication_exception.dart';
import 'package:cueue/domain/usecase/di/usecase_provider.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/global/modal/fried_toast.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authentication_page.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authentication_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReauthenticationDialog {
  ReauthenticationDialog(this._context, this._ref, this._exception);

  final BuildContext _context;
  final WidgetRef _ref;
  final RequireReauthenticationException _exception;

  Future<void> show() async {
    await showDialog<void>(
      context: _context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.needReAuthToContinue),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(_context).pop(),
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            TextButton(
              onPressed: _goAuthorization,
              child: Text(AppLocalizations.of(context)!.doReAuth),
            ),
          ],
        );
      },
    );
  }

  Future<void> _goAuthorization() async {
    final result = await Navigator.push<bool>(_context, MaterialPageRoute(builder: (context) => const AuthenticationPage(AuthenticationType.reauth)));
    if (result != null) {
      await _reupdateInfo();
      Navigator.of(_context).pop();
    }
  }

  Future<void> _reupdateInfo() async {
    try {
      await EasyLoading.show();
      await _exception.type.when(settingEmail: (email) async {
        final updateEmailUseCase = _ref.read(updateEmailUseCaseProvider);
        await updateEmailUseCase(email);
        await EasyLoading.dismiss();
        FriedToast(_context, AppLocalizations.of(_context)!.updatedMailAddress).show();
      }, settingPassword: (password) async {
        final updatePasswordUseCase = _ref.read(updatePasswordUseCaseProvider);
        await updatePasswordUseCase(password);
        await EasyLoading.dismiss();
        FriedToast(_context, AppLocalizations.of(_context)!.updatedPassword).show();
      });
    } on Exception catch (exception) {
      await EasyLoading.dismiss();
      await const ExceptionHandler().showMessageDialog(_context, _ref, exception);
    }
  }
}
