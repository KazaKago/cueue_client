import 'package:cueue/domain/model/hierarchy/info/app_info.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends HookConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(aboutViewModelProvider.select((viewModel) => viewModel.state));
    return Scaffold(
      appBar: AppBar(
        title: Text(intl(context).aboutApp),
      ),
      body: state.when(
        loading: () => _buildLoading(context, ref),
        completed: (appInfo) => _buildCompleted(context, ref, appInfo),
      ),
    );
  }

  Widget _buildLoading(BuildContext context, WidgetRef ref) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildCompleted(BuildContext context, WidgetRef ref, AppInfo appInfo) {
    final scrollController = useScrollController();
    return Scrollbar(
      controller: scrollController,
      child: ListView(
        controller: scrollController,
        children: [
          const SizedBox(height: 48),
          Center(child: Assets.images.icAppIcon.image(width: 196, height: 196)),
          const SizedBox(height: 12),
          Center(child: Text(appInfo.appName, style: Theme.of(context).textTheme.headline3)),
          const SizedBox(height: 12),
          Center(child: Text(intl(context).versionWith(appInfo.version), style: Theme.of(context).textTheme.subtitle1)),
          const SizedBox(height: 48),
          ListTile(
            title: Text(intl(context).webSite),
            leading: const Icon(Icons.open_in_browser),
            onTap: () => _openUri(appInfo.webSite),
          ),
          ListTile(
            title: Text(intl(context).mail),
            leading: const Icon(Icons.mail_outline),
            onTap: () => _openUri(appInfo.email.mailTo()),
          ),
          ListTile(
            title: Text(intl(context).ossLicense),
            leading: const Icon(Icons.attach_file),
            onTap: () => _goOssLicense(context, ref, appInfo),
          ),
          const SizedBox(height: 48),
          Center(child: Text(appInfo.copyright(), style: Theme.of(context).textTheme.caption)),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Future<bool> _openUri(Uri uri) {
    return launchUrl(uri);
  }

  Future<void> _goOssLicense(BuildContext context, WidgetRef ref, AppInfo appInfo) async {
    showLicensePage(
      context: context,
      applicationName: appInfo.appName,
      applicationVersion: appInfo.version,
      applicationIcon: Assets.images.icAppIcon.image(width: 128, height: 128),
      applicationLegalese: appInfo.copyright(),
    );
  }
}
