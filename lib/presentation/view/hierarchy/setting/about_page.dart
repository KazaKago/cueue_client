import 'package:cueue/domain/model/hierarchy/info/app_info.dart';
import 'package:cueue/domain/model/hierarchy/info/developer_info.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends HookConsumerWidget {
  const AboutPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final state = ref.watch(aboutViewModelProvider.select((viewModel) => viewModel.state));
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.aboutApp),
      ),
      body: SingleChildScrollView(
        child: state.when(
          loading: () => _buildLoading(context, ref),
          completed: (appInfo, developerInfo) => _buildCompleted(context, ref, appInfo, developerInfo),
        ),
      ),
    );
  }

  Widget _buildLoading(final BuildContext context, final WidgetRef ref) {
    return const SizedBox();
  }

  Widget _buildCompleted(final BuildContext context, final WidgetRef ref, final AppInfo appInfo, final DeveloperInfo developerInfo) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 48),
        Assets.images.icAppIcon.image(width: 196, height: 196),
        const SizedBox(height: 12),
        Text(appInfo.appName, style: Theme.of(context).textTheme.headline3),
        const SizedBox(height: 12),
        Text(AppLocalizations.of(context)!.versionWith(appInfo.version), style: Theme.of(context).textTheme.subtitle1),
        const SizedBox(height: 48),
        ListTile(
          title: Text(AppLocalizations.of(context)!.webSite),
          leading: const Icon(Icons.open_in_browser),
          onTap: () => _openUri(developerInfo.webSite),
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.mail),
          leading: const Icon(Icons.mail_outline),
          onTap: () => _openUri(developerInfo.email.mailTo()),
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.ossLicense),
          leading: const Icon(Icons.attach_file),
          onTap: () => _goOssLicense(context, ref, appInfo, developerInfo),
        ),
        const SizedBox(height: 48),
        Text(developerInfo.copyright(), style: Theme.of(context).textTheme.caption),
        const SizedBox(height: 16),
      ],
    );
  }

  Future<bool> _openUri(final Uri uri) {
    return launch(uri.toString());
  }

  Future<void> _goOssLicense(final BuildContext context, final WidgetRef ref, final AppInfo appInfo, final DeveloperInfo developerInfo) async {
    showLicensePage(
      context: context,
      applicationName: appInfo.appName,
      applicationVersion: appInfo.version,
      applicationIcon: Assets.images.icAppIcon.image(width: 128, height: 128),
      applicationLegalese: developerInfo.copyright(),
    );
  }
}
