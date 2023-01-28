import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/model/invitation/invitation_code.dart';
import 'package:cueue/ui/hierarchy/auth/authentication_page.dart';
import 'package:cueue/ui/hierarchy/invitation/invitation_creation_page.dart';
import 'package:cueue/ui/hierarchy/invitation/invitation_info_page.dart';
import 'package:cueue/ui/hierarchy/invitation/invitation_input_page.dart';
import 'package:cueue/ui/hierarchy/main/main_page.dart';
import 'package:cueue/ui/hierarchy/setting/about_page.dart';
import 'package:cueue/ui/hierarchy/setting/account_deletion_page.dart';
import 'package:cueue/ui/hierarchy/setting/settings_page.dart';
import 'package:cueue/ui/hierarchy/setting/thanks_for_using_page.dart';
import 'package:cueue/ui/hierarchy/splash/splash_page.dart';
import 'package:cueue/ui/hierarchy/welcome/user_creation_page.dart';
import 'package:cueue/ui/hierarchy/welcome/workspace_creation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

SWRTriggerState<Widget, void> _usePushPage() {
  final context = useContext();
  return useSWRTrigger((page) {
    return Future.microtask(() {
      return Navigator.push<void>(context, MaterialPageRoute(builder: (context) => page));
    });
  });
}

SWRTriggerState<Widget, void> _useReplacePage() {
  final context = useContext();
  return useSWRTrigger((page) {
    final pageRoute = PageRouteBuilder<Widget>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
    return Future.microtask(() {
      return Navigator.pushAndRemoveUntil<void>(context, pageRoute, (route) => false);
    });
  });
}

SWRTriggerState<T, void> usePop<T>() {
  final context = useContext();
  return useSWRTrigger((value) {
    return Future.microtask(() {
      return Navigator.of(context).pop(value);
    });
  });
}

SWRTriggerState<InvitationCode, void> usePushInvitationInfoPage() {
  final pushPage = _usePushPage();
  return useSWRTrigger((invitationCode) {
    return pushPage.trigger(InvitationInfoPage(invitationCode));
  });
}

SWRTriggerState<void, void> usePushAccountDeletionPage() {
  final pushPage = _usePushPage();
  return useSWRTrigger((_) {
    return pushPage.trigger(const AccountDeletionPage());
  });
}

SWRTriggerState<void, void> usePushAboutPage() {
  final pushPage = _usePushPage();
  return useSWRTrigger((_) {
    return pushPage.trigger(const AboutPage());
  });
}

SWRTriggerState<void, void> usePushInvitationInputPage() {
  final pushPage = _usePushPage();
  return useSWRTrigger((_) {
    return pushPage.trigger(const InvitationInputPage());
  });
}

SWRTriggerState<void, void> usePushSettingsPage() {
  final pushPage = _usePushPage();
  return useSWRTrigger((_) {
    return pushPage.trigger(const SettingsPage());
  });
}

SWRTriggerState<void, void> usePushInvitationCreationPage() {
  final pushPage = _usePushPage();
  return useSWRTrigger((_) {
    return pushPage.trigger(const InvitationCreationPage());
  });
}

SWRTriggerState<void, void> useReplaceThanksForUsingPage() {
  final replacePage = _useReplacePage();
  return useSWRTrigger((_) {
    return replacePage.trigger(const ThanksForUsingPage());
  });
}

SWRTriggerState<void, void> useReplaceAuthenticationPage() {
  final replacePage = _useReplacePage();
  return useSWRTrigger((_) {
    return replacePage.trigger(const AuthenticationPage());
  });
}

SWRTriggerState<void, void> useReplaceUserCreationPage() {
  final replacePage = _useReplacePage();
  return useSWRTrigger((_) {
    return replacePage.trigger(const UserCreationPage());
  });
}

SWRTriggerState<void, void> useReplaceWorkspaceCreationPage() {
  final replacePage = _useReplacePage();
  return useSWRTrigger((_) {
    return replacePage.trigger(const WorkspaceCreationPage());
  });
}

SWRTriggerState<void, void> useReplaceMainPage() {
  final replacePage = _useReplacePage();
  return useSWRTrigger((_) {
    return replacePage.trigger(const MainPage());
  });
}

SWRTriggerState<void, void> useReplaceSplashPage() {
  final replacePage = _useReplacePage();
  return useSWRTrigger((_) {
    return replacePage.trigger(const SplashPage());
  });
}
