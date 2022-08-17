import 'package:flutter/material.dart';

class ProjectExpansionTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final List<Widget> children;
  const ProjectExpansionTile(
      {Key? key,
      required this.icon,
      required this.text,
      required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(icon),
      title: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline5,
      ),
      children: children,
    );
  }
}
