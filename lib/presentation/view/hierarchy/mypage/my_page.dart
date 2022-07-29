import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/exception/exception_handler.dart';
import 'package:cueue/presentation/view/global/modal/simple_message_dialog.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/hierarchy/setting/settings_page.dart';
import 'package:cueue/presentation/view/hierarchy/welcome/welcome_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPage extends HookConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(myPageViewModelProvider);
    ref
      ..listen<Event<void>>(myPageViewModelProvider.select((viewModel) => viewModel.replaceWelcomePageEvent), (previous, replaceWelcomePageEvent) {
        replaceWelcomePageEvent((_) => _replaceWelcomePage(context));
      })
      ..listen<Event<Exception>>(settingsViewModelProvider.select((viewModel) => viewModel.exceptionEvent), (previous, exceptionEvent) {
        exceptionEvent((exception) => _showErrorDialog(context, ref, exception));
      })
      ..listen<bool>(settingsViewModelProvider.select((viewModel) => viewModel.isLoading), (previous, isLoading) {
        isLoading ? EasyLoading.show() : EasyLoading.dismiss();
      });
    return Scaffold(
      appBar: AppBar(
        title: Text(intl(context).mypage),
        actions: [
          IconButton(
            onPressed: () => _goSettings(context),
            icon: const Icon(Icons.settings),
            tooltip: intl(context).settings,
          ),
          IconButton(
            onPressed: () => _showSignOutConfirmationDialog(context, ref),
            icon: const Icon(Icons.exit_to_app),
            tooltip: intl(context).logout,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: viewModel.refresh,
        child: Scrollbar(
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              const SizedBox(height: 16),
              _buildProfileImage(context, ref),
              _buildNickNameTitle(context, ref),
              _buildNickname(context, ref),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myPageViewModelProvider.select((viewModel) => viewModel.state));
    return state.when(
      loading: CircularProgressIndicator.new,
      completed: (state) => _buildImage(context, state.photoUrl),
      error: ErrorHandlingWidget.new,
    );
  }

  Widget _buildImage(BuildContext context, Uri? photoUrl) {
    if (photoUrl != null) {
      return CachedNetworkImage(
        imageUrl: photoUrl.toString(),
        fit: BoxFit.fitHeight,
        width: 120,
        height: 120,
        fadeInDuration: const Duration(milliseconds: 300),
      );
    } else {
      return Container(
        color: Theme.of(context).colorScheme.secondary,
        width: 120,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Assets.images.icAppIcon.image(color: Theme.of(context).hoverColor),
        ),
      );
    }
  }

  Widget _buildNickNameTitle(BuildContext context, WidgetRef ref) {
    return ListTile(
      subtitle: Text(intl(context).nickname, style: Theme.of(context).textTheme.caption),
    );
  }

  Widget _buildNickname(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myPageViewModelProvider.select((viewModel) => viewModel.state));
    return state.when(
      loading: () => ListTile(
        leading: const Icon(Icons.account_circle_outlined),
        title: Text(intl(context).loading),
      ),
      completed: (user) => ListTile(
        leading: const Icon(Icons.account_circle_outlined),
        title: Text(user.displayName),
      ),
      error: (exception) => ListTile(
        leading: const Icon(Icons.account_circle_outlined),
        title: Text(intl(context).errorLoading),
      ),
    );
  }

  Future<void> _goSettings(BuildContext context) async {
    await Navigator.push<SettingsPage>(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
  }

  Future<void> _showSignOutConfirmationDialog(BuildContext context, WidgetRef ref) async {
    final event = await SimpleMessageDialog(context, title: intl(context).confirm, message: intl(context).confirmLogout, positiveButton: intl(context).logout, negativeButton: intl(context).cancel).show();
    if (event != null) {
      await event.when(
        positive: () async {
          final viewModel = ref.read(myPageViewModelProvider);
          await viewModel.signOut();
        },
        negative: () {},
        neutral: () {},
      );
    }
  }

  Future<void> _replaceWelcomePage(BuildContext context) {
    return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const WelcomePage()), (_) => false);
  }

  Future<void> _showErrorDialog(BuildContext context, WidgetRef ref, Exception exception) async {
    await const ExceptionHandler().showMessageDialog(context, ref, exception);
  }
}
