import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/hooks/hierarchy/splash/use_check_at_launch.dart';
import 'package:cueue/model/exception/no_such_element_exception.dart';
import 'package:cueue/model/exception/not_found_exception.dart';
import 'package:cueue/ui/global/widget/error_handling_widget.dart';
import 'package:cueue/ui/global/widget/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkAtLaunch = useCheckAtLaunch(ref);
    final error = checkAtLaunch.error;
    final Widget widget;
    if (error != null && error is! NotFoundException && error is! NoSuchElementException) {
      widget = ErrorHandlingWidget(error);
    } else {
      widget = _buildContent();
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: widget,
    );
  }

  Widget _buildContent() {
    return Center(
      child: ShimmerContainer(
        child: Assets.images.icAppIcon.image(width: 144, height: 144),
      ),
    );
  }
}
