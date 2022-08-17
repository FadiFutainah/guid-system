import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final double? width;
  final Widget child;
  const AppContainer({
    Key? key,
    required this.child,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 3.0,
          ),
        ],
      ),
      margin: const EdgeInsets.all(8),
      child: child,
    );
  }
}
