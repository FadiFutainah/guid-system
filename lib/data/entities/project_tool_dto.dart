import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/data/entities/tool_feature_dto.dart';

class ProjectToolDto {
  final int id;
  final String title;
  final List<ProjectToolFeatureDto> toolFeatures;

  const ProjectToolDto({
    required this.id,
    required this.title,
    required this.toolFeatures,
  });

  ProjectToolDto copyWith({
    int? id,
    String? title,
    List<ProjectToolFeatureDto>? toolFeatures,
  }) {
    return ProjectToolDto(
      id: id ?? this.id,
      title: title ?? this.title,
      toolFeatures: toolFeatures ?? this.toolFeatures,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'toolFeatures': toolFeatures.map((x) => x.toMap()).toList(),
    };
  }

  factory ProjectToolDto.fromMap(Map<String, dynamic> map) {
    return ProjectToolDto(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      toolFeatures: List<ProjectToolFeatureDto>.from(
          map['toolFeatures']?.map((x) => ProjectToolFeatureDto.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectToolDto.fromJson(String source) =>
      ProjectToolDto.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProjectToolDto(id: $id, title: $title, toolFeatures: $toolFeatures)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProjectToolDto &&
        other.id == id &&
        other.title == title &&
        listEquals(other.toolFeatures, toolFeatures);
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ toolFeatures.hashCode;
}
