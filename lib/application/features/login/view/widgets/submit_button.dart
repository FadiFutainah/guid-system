import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const SubmitButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.h,
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text, style: Theme.of(context).textTheme.button),
      ),
    );
  }
}
