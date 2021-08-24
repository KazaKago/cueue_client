import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FriedToast {
  FriedToast(final BuildContext context, this._text, {final IconData iconData = Icons.check}) : _iconData = iconData {
    FToast().init(context);
  }

  final String _text;
  final IconData _iconData;

  void show() {
    final Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.black54,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_iconData, color: Colors.white, size: 96),
          const SizedBox(height: 12),
          Text(_text, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
    FToast().showToast(child: toast, gravity: ToastGravity.CENTER);
  }
}
