import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class MarkDto {
  final int id;
  final String subjectName;
  final String mark;
  final String date;

  const MarkDto({
    required this.id,
    required this.subjectName,
    required this.mark,
    required this.date,
  });

  MarkDto copyWith({
    int? id,
    String? subjectName,
    String? mark,
    String? date,
  }) {
    return MarkDto(
      id: id ?? this.id,
      subjectName: subjectName ?? this.subjectName,
      mark: mark ?? this.mark,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subjectName': subjectName,
      'mark': mark,
      'date': date,
    };
  }

  factory MarkDto.fromMap(Map<String, dynamic> map) {
    return MarkDto(
      id: map['id']?.toInt() ?? 0,
      subjectName: map['subjectName'] ?? '',
      mark: map['mark'] ?? '',
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MarkDto.fromJson(String source) =>
      MarkDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MarkDto(id: $id, subjectName: $subjectName, mark: $mark, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MarkDto &&
        other.id == id &&
        other.subjectName == subjectName &&
        other.mark == mark &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^ subjectName.hashCode ^ mark.hashCode ^ date.hashCode;
  }
}
