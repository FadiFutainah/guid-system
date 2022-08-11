import 'dart:convert';

import 'package:flutter/widgets.dart';

@immutable
class PageFeedbackDto {
  final int id;
  final String content;

  const PageFeedbackDto({
    required this.id,
    required this.content,
  });

  PageFeedbackDto copyWith({
    int? id,
    String? content,
  }) {
    return PageFeedbackDto(
      id: id ?? this.id,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
    };
  }

  factory PageFeedbackDto.fromMap(Map<String, dynamic> map) {
    return PageFeedbackDto(
      id: map['id']?.toInt() ?? 0,
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PageFeedbackDto.fromJson(String source) =>
      PageFeedbackDto.fromMap(json.decode(source));

  @override
  String toString() => 'PageFeedbackDto(id: $id, content: $content)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PageFeedbackDto &&
        other.id == id &&
        other.content == content;
  }

  @override
  int get hashCode => id.hashCode ^ content.hashCode;
}
