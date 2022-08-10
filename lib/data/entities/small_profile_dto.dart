import 'dart:convert';

import 'package:flutter/widgets.dart';

@immutable
class SmallProfileDto {
  final int userId;
  final String username;
  final String gender;
  final String photo;
  const SmallProfileDto({
    required this.userId,
    required this.username,
    required this.gender,
    required this.photo,
  });

  SmallProfileDto copyWith({
    int? userId,
    String? username,
    String? gender,
    String? photo,
  }) {
    return SmallProfileDto(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      gender: gender ?? this.gender,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': username,
      'gender': gender,
      'photo': photo,
    };
  }

  factory SmallProfileDto.fromMap(Map<String, dynamic> map) {
    return SmallProfileDto(
      userId: map['userId']?.toInt() ?? 0,
      username: map['username'] ?? '',
      gender: map['gender'] ?? '',
      photo: map['photo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SmallProfileDto.fromJson(String source) =>
      SmallProfileDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SmallProfileDto(userId: $userId, username: $username, gender: $gender, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SmallProfileDto &&
        other.userId == userId &&
        other.username == username &&
        other.gender == gender &&
        other.photo == photo;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        username.hashCode ^
        gender.hashCode ^
        photo.hashCode;
  }
}
