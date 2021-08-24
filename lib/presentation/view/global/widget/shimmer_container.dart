import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({required this.child, final Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(final BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).highlightColor,
      highlightColor: Colors.white24,
      period: const Duration(milliseconds: 1000),
      child: child,
    );
  }
}
