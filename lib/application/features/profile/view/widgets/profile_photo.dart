import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  final String photo;
  final double? radius;
  final double? iconSize;
  const ProfilePhoto({
    Key? key,
    required this.photo,
    this.radius,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: photo,
      imageBuilder: (context, imageProvider) => Container(
        width: radius! * 2,
        height: radius! * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => CircleAvatar(
        radius: radius,
        backgroundColor: Colors.grey[400],
        child: Icon(
          CupertinoIcons.person,
          size: iconSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
