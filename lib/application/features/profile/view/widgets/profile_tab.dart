import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  final String title;
  const ProfileTab({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
