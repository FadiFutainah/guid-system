import 'package:app/application/utils/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'discussion_forum_widget.dart';
import 'forum_button.dart';

class ForumsList extends StatelessWidget {
  const ForumsList({
    Key? key,
  }) : super(key: key);

  Widget _buildForums() {
    // if (isEmpty) {
    //   return const ErrorMessageWidget(text: 'no forums added');
    // }
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return DiscussionForumWidget(
          title: 'does it matter if the earth is rotating around the sun ?',
          tags: const ['chip', 'chip', 'chip', 'chip', 'chip', 'chip'],
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
                    AutoRouter.of(context).push(ForumRoute());
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
