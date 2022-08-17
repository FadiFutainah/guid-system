import 'package:app/application/features/all_forums/view/widgets/discussion_forum_widget.dart';
import 'package:app/application/features/all_forums/view/widgets/forum_button.dart';
import 'package:app/application/features/profile/view/widgets/devidered_title.dart';
import 'package:app/application/features/profile/view/widgets/space.dart';
import 'package:app/application/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ForumPage extends StatelessWidget {
  ForumPage({Key? key}) : super(key: key);

  final TextEditingController textField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(text: 'DISCUSSIONS'),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          const Space(),
          const DivideredTitle(title: 'ANSWERS'),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return DiscussionForumWidget(
                  title: index == 0
                      ? 'does it matter if the earth is rotating around the sun ?'
                      : null,
                  tags: index == 0
                      ? ['tag', 'tag', 'tag', 'tag', 'tag', 'tag']
                      : null,
                  bottomWidgets: [
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ForumButton(
                          text: 'Up Vote',
                          icon: Icons.arrow_upward,
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
                          text: 'Down Vote',
                          icon: Icons.arrow_downward,
                          width: 40.w,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 16.0),
            child: TextField(
              controller: textField,
              style: Theme.of(context).textTheme.headline6,
              maxLines: 1,
              onChanged: (value) {
                // if (value == '') {
                //   setMaxLines(4);
                // }
              },
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.send),
                hintText: 'Add Your Answer',
                hintStyle: Theme.of(context).textTheme.headline3,
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.comment),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
