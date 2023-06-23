import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/hooks/global/utils/use_intl.dart';
import 'package:cueue/hooks/global/utils/use_show_license_page.dart';
import 'package:cueue/hooks/global/utils/use_theme.dart';
import 'package:cueue/hooks/hierarchy/setting/use_get_app_info.dart';
import 'package:cueue/model/info/app_info.dart';
import 'package:cueue/ui/global/widget/default_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends HookWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final intl = useIntl();
    final getAppInfoState = useGetAppInfo();
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.aboutApp),
      ),
      body: DefaultStateWidget<AppInfo>(
        state: getAppInfoState,
        child: _buildContent,
      ),
    );
  }

  Widget _buildContent(AppInfo appInfo) {
    final intl = useIntl();
    final theme = useTheme();
    final showLicensePage = useShowLicensePage();
    final scrollController = useScrollController();
    return Scrollbar(
      controller: scrollController,
      child: ListView(
        controller: scrollController,
        children: [
          const SizedBox(height: 48),
          Center(child: Assets.images.icAppIcon.image(width: 196, height: 196)),
          const SizedBox(height: 12),
          Center(child: Text(appInfo.appName, style: theme.textTheme.displaySmall)),
          const SizedBox(height: 12),
          Center(child: Text(intl.versionWith(appInfo.version), style: theme.textTheme.titleMedium)),
          const SizedBox(height: 48),
          ListTile(
            title: Text(intl.webSite),
            leading: const Icon(Icons.open_in_browser),
            onTap: () => launchUrl(appInfo.webSite),
          ),
          ListTile(
            title: Text(intl.mail),
            leading: const Icon(Icons.mail_outline),
            onTap: () => launchUrl(appInfo.email.mailTo()),
          ),
          ListTile(
            title: Text(intl.ossLicense),
            leading: const Icon(Icons.attach_file),
            onTap: showLicensePage,
          ),
          const SizedBox(height: 48),
          Center(child: Text(appInfo.copyright(), style: theme.textTheme.bodySmall)),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
