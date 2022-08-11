import 'dart:convert';

import 'package:app/data/entities/reply_dto.dart';

class ForumDto {
  int id;
  int userId;
  String title;
  String content;
  bool isQuestion;
  String time;
  int points;
  bool isClosed;
  ReplyDto closedReply;

  ForumDto({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.isQuestion,
    required this.time,
    required this.points,
    required this.isClosed,
    required this.closedReply,
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
    ReplyDto? closedReply,
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
      closedReply: closedReply ?? this.closedReply,
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
      'closedReply': closedReply.toMap(),
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
      closedReply: ReplyDto.fromMap(map['closedReply']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ForumDto.fromJson(String source) =>
      ForumDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ForumDto(id: $id, userId: $userId, title: $title, content: $content, isQuestion: $isQuestion, time: $time, points: $points, isClosed: $isClosed, closedReply: $closedReply)';
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
        other.closedReply == closedReply;
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
        closedReply.hashCode;
  }
}
