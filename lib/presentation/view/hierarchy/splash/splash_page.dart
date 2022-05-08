import 'package:cueue/domain/usecase/hierarchy/auth/launch_check_result.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/presentation/view/hierarchy/main/main_page.dart';
import 'package:cueue/presentation/view/hierarchy/welcome/welcome_page.dart';
import 'package:cueue/presentation/view/hierarchy/welcome/workspace_creation_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashAnimationController = useAnimationController(duration: const Duration(milliseconds: 500));
    ref.listen<Event<LaunchCheckResult>>(splashViewModelProvider.select((viewModel) => viewModel.nextRouteEvent), (previous, nextRouteEvent) {
      nextRouteEvent((nextRoute) {
        splashAnimationController
          ..addStatusListener((status) => _splashAnimationHandler(context, status, nextRoute))
          ..forward();
      });
    });
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: ScaleTransition(
          scale: splashAnimationController.drive(CurveTween(curve: const Cubic(0.6, -0.02, 0.735, 0.045))).drive(Tween<double>(begin: 1, end: 50)),
          child: Assets.images.icAppIcon.image(width: 128, height: 128, color: Theme.of(context).scaffoldBackgroundColor),
        ),
      ),
    );
  }

  Future<void> _splashAnimationHandler(BuildContext context, AnimationStatus status, LaunchCheckResult nextRoute) async {
    switch (status) {
      case AnimationStatus.dismissed:
        break;
      case AnimationStatus.forward:
        break;
      case AnimationStatus.reverse:
        break;
      case AnimationStatus.completed:
        await Navigator.pushAndRemoveUntil(context, _getNextRoute(nextRoute), (route) => false);
        break;
    }
  }

  Route<Widget> _getNextRoute(LaunchCheckResult nextRoute) {
    Widget page;
    switch (nextRoute) {
      case LaunchCheckResult.beforeSignIn:
        page = const WelcomePage();
        break;
      case LaunchCheckResult.workspaceCreation:
        page = const WorkspaceCreationPage();
        break;
      case LaunchCheckResult.afterSignIn:
        page = const MainPage();
        break;
    }
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
