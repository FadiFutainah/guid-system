import 'package:flutter/material.dart';

class ForumButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final double width;
  const ForumButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.headline4,
            ),
            Icon(
              icon,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
