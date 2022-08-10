import 'dart:convert';

import 'package:flutter/widgets.dart';

@immutable
class ProjectFeatureDto {
  final int id;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  const ProjectFeatureDto({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
  });

  ProjectFeatureDto copyWith({
    int? id,
    String? title,
    String? description,
    String? startDate,
    String? endDate,
  }) {
    return ProjectFeatureDto(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory ProjectFeatureDto.fromMap(Map<String, dynamic> map) {
    return ProjectFeatureDto(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectFeatureDto.fromJson(String source) =>
      ProjectFeatureDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProjectFeatureDto(id: $id, title: $title, description: $description, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProjectFeatureDto &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        startDate.hashCode ^
        endDate.hashCode;
  }
}
