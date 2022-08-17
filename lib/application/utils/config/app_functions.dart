import 'package:flutter/material.dart';

class AppFunctions {
  static void showSnackBar(BuildContext context, String message, Color color,
      {int? seconds}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: seconds ?? 1),
        content: SizedBox(child: Text(message, textAlign: TextAlign.center)),
        backgroundColor: color,
      ),
    );
  }
}
