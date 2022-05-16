import 'package:flutter/material.dart';

class TagLoadingItem extends StatelessWidget {
  const TagLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(width: double.infinity, height: 24, color: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
