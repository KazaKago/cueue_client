import 'package:cueue/hooks/global/utils/use_theme.dart';
import 'package:cueue/ui/global/widget/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuLoading extends HookConsumerWidget {
  const MenuLoading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 196, height: 20, color: theme.scaffoldBackgroundColor),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(backgroundColor: theme.scaffoldBackgroundColor),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: double.infinity, height: 24, color: theme.scaffoldBackgroundColor),
                    const SizedBox(height: 8),
                    Container(width: 196, height: 20, color: theme.scaffoldBackgroundColor),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
