import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget(this.message, {Key? key}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 17,
            height: 1.3,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
