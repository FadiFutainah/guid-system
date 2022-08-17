import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/data/entities/reply_dto.dart';
import 'package:app/data/entities/small_profile_dto.dart';

import 'tag_dto.dart';
import 'vote_date_dto.dart';

class ForumDto {
  int id;
  int userId;
  String title;
  String content;
  bool isQuestion;
  String time;
  int points;
  bool isClosed;
  bool isMine;
  VoteDataDto voteData;
  ReplyDto? closedReply;
  SmallProfileDto profile;
  List<TagDto> tags;
  ForumDto({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.isQuestion,
    required this.time,
    required this.points,
    required this.isClosed,
    required this.isMine,
    required this.voteData,
    this.closedReply,
    required this.profile,
    required this.tags,
  });

  ForumDto copyWith({
    int? id,
    int? userId,
    String? title,
    String? content,
    bool? isQuestion,
    String? time,
    int? points,
    bool? isClosed,
    bool? isMine,
    VoteDataDto? voteData,
    ReplyDto? closedReply,
    SmallProfileDto? profile,
    List<TagDto>? tags,
  }) {
    return ForumDto(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      content: content ?? this.content,
      isQuestion: isQuestion ?? this.isQuestion,
      time: time ?? this.time,
      points: points ?? this.points,
      isClosed: isClosed ?? this.isClosed,
      isMine: isMine ?? this.isMine,
      voteData: voteData ?? this.voteData,
      closedReply: closedReply ?? this.closedReply,
      profile: profile ?? this.profile,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'content': content,
      'isQuestion': isQuestion,
      'time': time,
      'points': points,
      'isClosed': isClosed,
      'isMine': isMine,
      'voteData': voteData.toMap(),
      'closedReply': closedReply?.toMap(),
      'profile': profile.toMap(),
      'tags': tags.map((x) => x.toMap()).toList(),
    };
  }

  factory ForumDto.fromMap(Map<String, dynamic> map) {
    return ForumDto(
      id: map['id']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      isQuestion: map['isQuestion'] ?? false,
      time: map['time'] ?? '',
      points: map['points']?.toInt() ?? 0,
      isClosed: map['isClosed'] ?? false,
      isMine: map['isMine'] ?? false,
      voteData: VoteDataDto.fromMap(map['voteData']),
      closedReply: map['closedReply'] != null
          ? ReplyDto.fromMap(map['closedReply'])
          : null,
      profile: SmallProfileDto.fromMap(map['profile']),
      tags: List<TagDto>.from(map['tags']?.map((x) => TagDto.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ForumDto.fromJson(String source) =>
      ForumDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ForumDto(id: $id, userId: $userId, title: $title, content: $content, isQuestion: $isQuestion, time: $time, points: $points, isClosed: $isClosed, isMine: $isMine, voteData: $voteData, closedReply: $closedReply, smallProfileDto: $profile, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ForumDto &&
        other.id == id &&
        other.userId == userId &&
        other.title == title &&
        other.content == content &&
        other.isQuestion == isQuestion &&
        other.time == time &&
        other.points == points &&
        other.isClosed == isClosed &&
        other.isMine == isMine &&
        other.voteData == voteData &&
        other.closedReply == closedReply &&
        other.profile == profile &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        title.hashCode ^
        content.hashCode ^
        isQuestion.hashCode ^
        time.hashCode ^
        points.hashCode ^
        isClosed.hashCode ^
        isMine.hashCode ^
        voteData.hashCode ^
        closedReply.hashCode ^
        profile.hashCode ^
        tags.hashCode;
  }
}
