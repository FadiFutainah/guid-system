import 'dart:convert';

class ReplyDto {
  int id;
  int userId;
  String content;
  String time;
  int points;

  ReplyDto({
    required this.id,
    required this.userId,
    required this.content,
    required this.time,
    required this.points,
  });

  ReplyDto copyWith({
    int? id,
    int? userId,
    String? content,
    String? time,
    int? points,
  }) {
    return ReplyDto(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      content: content ?? this.content,
      time: time ?? this.time,
      points: points ?? this.points,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'content': content,
      'time': time,
      'points': points,
    };
  }

  factory ReplyDto.fromMap(Map<String, dynamic> map) {
    return ReplyDto(
      id: map['id']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      content: map['content'] ?? '',
      time: map['time'] ?? '',
      points: map['points']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReplyDto.fromJson(String source) =>
      ReplyDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReplyDto(id: $id, userId: $userId, content: $content, time: $time, points: $points)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReplyDto &&
        other.id == id &&
        other.userId == userId &&
        other.content == content &&
        other.time == time &&
        other.points == points;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        content.hashCode ^
        time.hashCode ^
        points.hashCode;
  }
}
