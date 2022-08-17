import 'package:flutter/material.dart';

class ForumContainer extends StatelessWidget {
  final Widget child;
  const ForumContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black12),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(8),
      child: child,
    );
  }
}
