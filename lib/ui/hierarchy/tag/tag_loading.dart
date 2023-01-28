import 'package:cueue/hooks/global/utils/use_theme.dart';
import 'package:cueue/ui/global/widget/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TagLoading extends HookWidget {
  const TagLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerContainer(
      child: Wrap(
        children: List.filled(20, _buildItem()),
      ),
    );
  }

  Widget _buildItem() {
    final theme = useTheme();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(width: double.infinity, height: 24, color: theme.scaffoldBackgroundColor),
    );
  }
}
