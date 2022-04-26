import 'package:flutter/material.dart';

class LoadingListItem extends StatelessWidget {
  const LoadingListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
