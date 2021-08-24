import 'package:flutter/material.dart';

class TagLoadingItem extends StatelessWidget {
  const TagLoadingItem({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(width: double.infinity, height: 24, color: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
