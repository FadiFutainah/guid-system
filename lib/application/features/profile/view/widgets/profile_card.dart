import 'package:app/application/features/profile/view/widgets/profile_photo.dart';
import 'package:app/domain/models/profile_card_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'space.dart';

class ProfileCard extends StatelessWidget {
  final ProfileCardModel card;
  const ProfileCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ProfilePhoto(photo: card.photo, iconSize: 80, radius: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                card.username,
                style: Theme.of(context).textTheme.headline1,
              ),
              const Space(),
              Text(
                '${card.points} ponit',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
