import 'package:flutter/material.dart';

class AppFunctions {
  static void showErrorSnackBar(
      BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: SizedBox(child: Text(message, textAlign: TextAlign.center)),
        backgroundColor: color,
      ),
    );
  }
}
