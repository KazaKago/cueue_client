import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/presentation/view/hierarchy/main/main_page.dart';
import 'package:cueue/presentation/view/hierarchy/welcome/welcome_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/splash/splash_route_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final splashAnimationController = useAnimationController(duration: const Duration(milliseconds: 500));
    ref.listen<Event<NextSplashRoutePattern>>(splashViewModelProvider.select((viewModel) => viewModel.nextRouteEvent), (previous, nextRouteEvent) {
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

  void _splashAnimationHandler(final BuildContext context, final AnimationStatus status, final NextSplashRoutePattern nextRoute) {
    switch (status) {
      case AnimationStatus.dismissed:
        break;
      case AnimationStatus.forward:
        break;
      case AnimationStatus.reverse:
        break;
      case AnimationStatus.completed:
        Navigator.pushReplacement(context, _parseNextRoutePattern(nextRoute));
        break;
    }
  }

  Route<Widget> _parseNextRoutePattern(final NextSplashRoutePattern nextRoute) {
    Widget page;
    switch (nextRoute) {
      case NextSplashRoutePattern.main:
        page = const MainPage();
        break;
      case NextSplashRoutePattern.welcome:
        page = const WelcomePage();
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
