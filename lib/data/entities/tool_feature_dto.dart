import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'package:app/data/entities/project_feature_dto.dart';

@immutable
class ProjectToolFeatureDto {
  final int id;
  final ProjectFeatureDto feature;
  const ProjectToolFeatureDto({
    required this.id,
    required this.feature,
  });

  ProjectToolFeatureDto copyWith({
    int? id,
    ProjectFeatureDto? feature,
  }) {
    return ProjectToolFeatureDto(
      id: id ?? this.id,
      feature: feature ?? this.feature,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'feature': feature.toMap(),
    };
  }

  factory ProjectToolFeatureDto.fromMap(Map<String, dynamic> map) {
    return ProjectToolFeatureDto(
      id: map['id']?.toInt() ?? 0,
      feature: ProjectFeatureDto.fromMap(map['feature']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectToolFeatureDto.fromJson(String source) =>
      ProjectToolFeatureDto.fromMap(json.decode(source));

  @override
  String toString() => 'ProjectToolFeatureDto(id: $id, feature: $feature)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProjectToolFeatureDto &&
        other.id == id &&
        other.feature == feature;
  }

  @override
  int get hashCode => id.hashCode ^ feature.hashCode;
}
