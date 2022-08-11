import 'dart:convert';

import 'package:flutter/widgets.dart';

@immutable
class PageContentDto {
  final int id;
  final String title;
  final String content;
  final String link;

  const PageContentDto({
    required this.id,
    required this.title,
    required this.content,
    required this.link,
  });

  PageContentDto copyWith({
    int? id,
    String? title,
    String? content,
    String? link,
  }) {
    return PageContentDto(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'link': link,
    };
  }

  factory PageContentDto.fromMap(Map<String, dynamic> map) {
    return PageContentDto(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      link: map['link'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PageContentDto.fromJson(String source) =>
      PageContentDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PageContentDto(id: $id, title: $title, content: $content, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PageContentDto &&
        other.id == id &&
        other.title == title &&
        other.content == content &&
        other.link == link;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ content.hashCode ^ link.hashCode;
  }
}
