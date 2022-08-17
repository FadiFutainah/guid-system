import 'package:app/application/features/profile/view/widgets/profile_photo.dart';
import 'package:app/domain/models/profile_card_model.dart';
import 'package:app/domain/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import 'space.dart';

class ProfileCard extends StatelessWidget {
  final ProfileCardModel card;
  final bool isMine;
  final ProfileModel? profile;
  final Function(String, ProfileModel)? chooseImage;

  const ProfileCard({
    Key? key,
    required this.card,
    required this.isMine,
    this.chooseImage,
    this.profile,
  }) : super(key: key);

  Widget _buildChangePhotoButton() {
    if (!isMine) {
      return const SizedBox();
    }
    return Positioned(
      bottom: 0,
      left: 0,
      child: IconButton(
        onPressed: () async {
          var file = await ImagePicker().pickImage(
            source: ImageSource.gallery,
          );
          if (file != null) {
            chooseImage!(file.path, profile!);
          }
        },
        icon: const Icon(
          FontAwesomeIcons.circlePlus,
          color: Colors.black54,
          size: 25,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(
            children: [
              ProfilePhoto(photo: card.photo, iconSize: 80, radius: 50),
              _buildChangePhotoButton(),
            ],
          ),
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
