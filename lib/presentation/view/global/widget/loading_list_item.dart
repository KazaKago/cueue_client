import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingListItem extends StatelessWidget {
  const LoadingListItem({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
