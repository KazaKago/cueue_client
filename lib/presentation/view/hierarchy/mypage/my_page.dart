import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/hierarchy/setting/settings_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPage extends HookConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(myPageViewModelProvider);
    final state = ref.watch(myPageViewModelProvider.select((viewModel) => viewModel.state));
    return Scaffold(
      appBar: AppBar(
        title: Text(intl(context).mypage),
        actions: [
          IconButton(onPressed: () => _goSettings(context), icon: const Icon(Icons.settings)),
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
              _buildMailAddressTitle(context, ref),
              _buildEmailChangingTile(context, ref),
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

  Widget _buildMailAddressTitle(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(intl(context).mailAddress, style: Theme.of(context).textTheme.caption),
    );
  }

  Widget _buildEmailChangingTile(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsViewModelProvider.select((viewModel) => viewModel.state));
    return state.when(
      loading: () => ListTile(
        leading: const Icon(Icons.mail_outline),
        title: Text(intl(context).loading),
      ),
      completed: (user) => ListTile(
        leading: const Icon(Icons.mail_outline),
        title: Text(user.email.value),
      ),
      error: (exception) => ListTile(
        leading: const Icon(Icons.mail_outline),
        title: Text(intl(context).errorLoading),
      ),
    );
  }

  Future<void> _goSettings(BuildContext context) async {
    await Navigator.push<SettingsPage>(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
  }
}
