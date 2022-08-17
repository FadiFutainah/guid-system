import 'package:flutter/material.dart';

class InfoField extends StatelessWidget {
  final IconData icon;
  final String text;
  final String value;
  const InfoField({
    Key? key,
    required this.icon,
    required this.text,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Icon(icon, color: Theme.of(context).primaryColor),
        ),
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            value,
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
