import 'package:app/application/features/profile/view/widgets/profile_photo.dart';
import 'package:flutter/material.dart';

class UserForumTile extends StatelessWidget {
  const UserForumTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const ProfilePhoto(
        photo: 'member.photo',
        iconSize: 33,
      ),
      title: Text(
        'member.username',
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: const Text('Auther'),
      trailing: RichText(
        text: TextSpan(
          text: '',
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: '1289',
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
