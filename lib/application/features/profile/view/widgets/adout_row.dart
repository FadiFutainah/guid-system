import 'package:flutter/material.dart';

class AboutRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final String value;
  const AboutRow({
    Key? key,
    required this.icon,
    required this.text,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon),
        Text(text),
        Text(value),
      ],
    );
  }
}
