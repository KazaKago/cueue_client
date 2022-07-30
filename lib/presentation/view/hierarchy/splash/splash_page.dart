import 'package:cueue/domain/model/hierarchy/auth/launch_check_result.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/presentation/view/global/widget/error_handling_widget.dart';
import 'package:cueue/presentation/view/global/widget/shimmer_container.dart';
import 'package:cueue/presentation/view/hierarchy/auth/authentication_page.dart';
import 'package:cueue/presentation/view/hierarchy/main/main_page.dart';
import 'package:cueue/presentation/view/hierarchy/welcome/workspace_creation_page.dart';
import 'package:cueue/presentation/viewmodel/di/viewmodel_provider.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(splashViewModelProvider);
    final state = ref.watch(splashViewModelProvider.select((viewModel) => viewModel.state));
    ref.listen<Event<LaunchCheckResult>>(splashViewModelProvider.select((viewModel) => viewModel.nextRouteEvent), (previous, nextRouteEvent) {
      nextRouteEvent((nextRoute) => Navigator.pushAndRemoveUntil(context, _getNextRoute(nextRoute), (route) => false));
    });
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: state.when(
          loading: () => ShimmerContainer(
            child: Assets.images.icAppIcon.image(width: 144, height: 144),
          ),
          error: (exception) => ErrorHandlingWidget(exception, onClickRetry: viewModel.retry),
        ),
      ),
    );
  }

  Route<Widget> _getNextRoute(LaunchCheckResult nextRoute) {
    Widget page;
    switch (nextRoute) {
      case LaunchCheckResult.beforeSignIn:
        page = const AuthenticationPage();
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
