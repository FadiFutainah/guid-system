import 'package:app/application/features/profile/view/widgets/profile_photo.dart';
import 'package:flutter/material.dart';

class UserForumTile extends StatelessWidget {
  final String username;
  final String photo;
  final int points;
  final String gender;
  const UserForumTile({
    Key? key,
    required this.username,
    required this.photo,
    required this.points,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfilePhoto(
        photo: photo,
        iconSize: 33,
      ),
      title: Text(
        username,
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: const Text('student'),
      trailing: RichText(
        text: TextSpan(
          text: '',
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: '$points',
              style: Theme.of(context).textTheme.caption,
            ),
            TextSpan(
              text: ' ponit',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
