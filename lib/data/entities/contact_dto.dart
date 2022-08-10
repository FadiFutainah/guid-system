
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class ContactDto {
  final int id;
  final String type;
  final String link;
  const ContactDto({
    required this.id,
    required this.type,
    required this.link,
  });

  ContactDto copyWith({
    int? id,
    String? type,
    String? link,
  }) {
    return ContactDto(
      id: id ?? this.id,
      type: type ?? this.type,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'link': link,
    };
  }

  factory ContactDto.fromMap(Map<String, dynamic> map) {
    return ContactDto(
      id: map['id'] ?? '',
      type: map['type'] ?? '',
      link: map['link'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactDto.fromJson(String source) =>
      ContactDto.fromMap(json.decode(source));

  @override
  String toString() => 'ContactDto(id: $id, type: $type, link: $link)';
}
