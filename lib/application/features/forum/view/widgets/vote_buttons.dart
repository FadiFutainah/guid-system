import 'package:app/application/features/all_forums/view/widgets/forum_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class VoteButtons extends StatelessWidget {
  const VoteButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
