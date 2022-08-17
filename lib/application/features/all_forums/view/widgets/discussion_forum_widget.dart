import 'package:app/application/features/profile/view/widgets/space.dart';
import 'package:flutter/material.dart';

import 'forum_container.dart';
import 'user_forum_tile.dart';

class DiscussionForumWidget extends StatelessWidget {
  final List<Widget> bottomWidgets;
  final List<String>? tags;
  final String? title;

  const DiscussionForumWidget({
    Key? key,
    required this.bottomWidgets,
    this.tags,
    this.title,
  }) : super(key: key);

  List<Widget> _buildChildren(BuildContext context) {
    List<Widget> children = [
      const Space(),
      const UserForumTile(),
    ];

    if (title != null) {
      children.add(
        Text(
          title!,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5,
        ),
      );
    }

    children.addAll([
      const Divider(),
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 5.0, 0.0, 8.0),
        child: Text(
          'content content content content content content content content content content content content content content content content content content contentcontent t t t content content content content content content content content content content',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      const Space(),
    ]);

    if (tags != null) {
      children.add(Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 5,
        spacing: 5,
        children: tags!.map((e) => Chip(label: Text(e))).toList(),
      ));
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return ForumContainer(
      child: Column(
        children: [
          ..._buildChildren(context),
          ...bottomWidgets,
        ],
      ),
    );
  }
}
