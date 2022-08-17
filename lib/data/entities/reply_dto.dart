import 'dart:convert';

import 'package:app/data/entities/small_profile_dto.dart';
import 'package:app/data/entities/vote_date_dto.dart';

class ReplyDto {
  int id;
  int userId;
  String content;
  String time;
  int points;
  bool isMine;
  VoteDataDto voteData;
  SmallProfileDto profile;

  ReplyDto({
    required this.id,
    required this.userId,
    required this.content,
    required this.time,
    required this.points,
    required this.isMine,
    required this.voteData,
    required this.profile,
  });

  ReplyDto copyWith({
    int? id,
    int? userId,
    String? content,
    String? time,
    int? points,
    bool? isMine,
    VoteDataDto? voteData,
    SmallProfileDto? profile,
  }) {
    return ReplyDto(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      content: content ?? this.content,
      time: time ?? this.time,
      points: points ?? this.points,
      isMine: isMine ?? this.isMine,
      voteData: voteData ?? this.voteData,
      profile: profile ?? this.profile,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'content': content,
      'time': time,
      'points': points,
      'isMine': isMine,
      'voteData': voteData.toMap(),
      'profile': profile.toMap(),
    };
  }

  factory ReplyDto.fromMap(Map<String, dynamic> map) {
    return ReplyDto(
      id: map['id']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      content: map['content'] ?? '',
      time: map['time'] ?? '',
      points: map['points']?.toInt() ?? 0,
      isMine: map['isMine'] ?? false,
      voteData: VoteDataDto.fromMap(map['voteData']),
      profile: SmallProfileDto.fromMap(map['profile']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReplyDto.fromJson(String source) =>
      ReplyDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReplyDto(id: $id, userId: $userId, content: $content, time: $time, points: $points, isMine: $isMine, voteData: $voteData, profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReplyDto &&
        other.id == id &&
        other.userId == userId &&
        other.content == content &&
        other.time == time &&
        other.points == points &&
        other.isMine == isMine &&
        other.voteData == voteData &&
        other.profile == profile;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        content.hashCode ^
        time.hashCode ^
        points.hashCode ^
        isMine.hashCode ^
        voteData.hashCode ^
        profile.hashCode;
  }
}
