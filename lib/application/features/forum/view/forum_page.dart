import 'package:app/application/features/all_forums/view/widgets/discussion_forum_widget.dart';
import 'package:app/application/features/profile/view/widgets/devidered_title.dart';
import 'package:app/application/features/profile/view/widgets/space.dart';
import 'package:app/application/widgets/loading_widget.dart';
import 'package:app/application/widgets/top_bar.dart';
import 'package:app/data/entities/forum_dto.dart';
import 'package:app/data/entities/reply_dto.dart';
import 'package:app/data/entities/tag_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../forum_cubit.dart';
import 'widgets/vote_buttons.dart';

class ForumPage extends StatelessWidget {
  final ForumDto forum;

  ForumPage({Key? key, required this.forum}) : super(key: key);

  final TextEditingController textField = TextEditingController();

  List<String> _getTags(List<TagDto> tags) {
    return List.from(tags.map((e) => e.tag.name));
  }

  Widget _getForumWidget() {
    return DiscussionForumWidget(
      title: forum.title,
      content: forum.content,
      points: forum.points,
      profile: forum.profile,
      tags: _getTags(forum.tags),
      bottomWidgets: const [
        Divider(),
        VoteButtons(),
      ],
    );
  }

  Widget _getReplyWidget(ReplyDto reply) {
    return DiscussionForumWidget(
      content: reply.content,
      points: reply.points,
      profile: reply.profile,
      bottomWidgets: const [
        Divider(),
        VoteButtons(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForumCubit(forum.id),
      child: Scaffold(
        appBar: const TopBar(text: 'DISCUSSIONS'),
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            const Space(),
            const DivideredTitle(title: 'ANSWERS'),
            Expanded(
              child: BlocBuilder<ForumCubit, ForumState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return const LoadingWidget();
                  }
                  if (state is Success) {
                    return ListView.builder(
                      itemCount: state.replies.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return _getForumWidget();
                        }
                        return _getReplyWidget(state.replies[index - 1]);
                      },
                    );
                  }
                  return Container();
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
      ),
    );
  }
}
