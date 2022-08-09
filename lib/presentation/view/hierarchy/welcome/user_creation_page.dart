import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/hierarchy/welcome/workspace_creation_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserCreationPage extends HookConsumerWidget {
  const UserCreationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(userCreationViewModelProvider);
    ref
      ..listen<bool>(userCreationViewModelProvider.select((viewModel) => viewModel.isLoading), (previous, isLoading) {
        isLoading ? EasyLoading.show() : EasyLoading.dismiss();
      })
      ..listen<Event<void>>(userCreationViewModelProvider.select((viewModel) => viewModel.completionEvent), (previous, event) {
        event.call((_) => _replaceUserCreationPage(context));
      })
      ..listen<Event<Exception>>(userCreationViewModelProvider.select((viewModel) => viewModel.exceptionEvent), (previous, event) {
        event((exception) => const ExceptionHandler().showMessageDialog(context, ref, exception));
      });
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Assets.images.icAppIcon.image(width: 256, height: 256),
                    const SizedBox(height: 12),
                    const Text('User Creation', style: TextStyle(fontSize: 60)),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                  child: ElevatedButton(
                    onPressed: viewModel.createUser,
                    child: Text(intl(context).close),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _replaceUserCreationPage(BuildContext context) async {
    await Navigator.pushAndRemoveUntil<void>(context, MaterialPageRoute(builder: (context) => const WorkspaceCreationPage()), (route) => false);
  }
}
