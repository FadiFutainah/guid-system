import 'package:app/application/utils/routes/router.gr.dart';
import 'package:app/domain/models/member_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'profile_photo.dart';

class UserProfileTile extends StatelessWidget {
  final MemberModel member;
  const UserProfileTile({
    Key? key,
    required this.member,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfilePhoto(photo: member.photo, iconSize: 33),
      title: Text(
        member.username,
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text(
        member.position,
        style: Theme.of(context).textTheme.headline4,
      ),
      trailing: IconButton(
        onPressed: () {
          AutoRouter.of(context)
              .push(ForeignProfileRoute(id: member.profileId));
        },
        icon: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
