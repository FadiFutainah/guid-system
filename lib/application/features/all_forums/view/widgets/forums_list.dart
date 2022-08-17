import 'package:app/application/utils/routes/router.gr.dart';
import 'package:app/application/widgets/error_message_widget.dart';
import 'package:app/data/entities/forum_dto.dart';
import 'package:app/data/entities/tag_dto.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'discussion_forum_widget.dart';
import 'forum_button.dart';

class ForumsList extends StatelessWidget {
  final List<ForumDto> forums;
  const ForumsList({
    Key? key,
    required this.forums,
  }) : super(key: key);

  List<String> _getTags(List<TagDto> tags) {
    return List.from(tags.map((e) => e.tag.name));
  }

  Widget _buildForums() {
    if (forums.isEmpty) {
      return const ErrorMessageWidget(text: 'no forums yet');
    }
    return ListView.builder(
      itemCount: forums.length,
      itemBuilder: (BuildContext context, int index) {
        ForumDto forum = forums[index];
        return DiscussionForumWidget(
          points: forum.points,
          profile: forum.profile,
          title: forum.title,
          content: forum.content,
          tags: _getTags(forum.tags),
          bottomWidgets: [
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ForumButton(
                  text: 'Suggest Tag',
                  icon: CupertinoIcons.tag,
                  width: 40.w,
                  onTap: () {},
                ),
                Container(
                  width: 1,
                  height: 35,
                  margin: const EdgeInsets.all(2),
                  color: Colors.grey,
                ),
                ForumButton(
                  text: 'View Discussion',
                  icon: Icons.forum_outlined,
                  width: 40.w,
                  onTap: () {
                    AutoRouter.of(context).push(ForumRoute(forum: forum));
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildForums();
  }
}
