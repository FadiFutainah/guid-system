import 'package:flutter/material.dart';

class ProjectTitle extends StatelessWidget {
  final String title;
  final bool isCertified;

  const ProjectTitle({
    Key? key,
    required this.title,
    required this.isCertified,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isCertified
            ? const Icon(Icons.verified, color: Colors.blue)
            : const SizedBox(),
        const SizedBox(width: 10),
        Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
      ],
    );
  }
}
