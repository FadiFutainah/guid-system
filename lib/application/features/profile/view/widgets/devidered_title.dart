import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DivideredTitle extends StatelessWidget {
  final String title;
  const DivideredTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 20.w,
          child: const Divider(thickness: 1),
        ),
        SizedBox(
          width: 40.w,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        SizedBox(
          width: 20.w,
          child: const Divider(thickness: 1),
        ),
      ],
    );
  }
}
