import 'package:cueue/hooks/global/utils/use_theme.dart';
import 'package:cueue/ui/global/widget/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RecipeLoading extends HookWidget {
  const RecipeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerContainer(
      child: Wrap(
        children: List.filled(10, _buildItem()),
      ),
    );
  }

  Widget _buildItem() {
    final theme = useTheme();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: theme.scaffoldBackgroundColor,
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: double.infinity, height: 24, color: theme.scaffoldBackgroundColor),
                const SizedBox(height: 8),
                Container(width: double.infinity, height: 20, color: theme.scaffoldBackgroundColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
