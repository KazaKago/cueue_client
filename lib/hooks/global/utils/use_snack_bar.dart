import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void Function(String) useShowSnackbar() {
  final context = useContext();
  return (message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  };
}
