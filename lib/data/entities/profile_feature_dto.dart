import 'dart:convert';

import 'package:flutter/widgets.dart';

@immutable
class ProfileFeatureDto {
  final int id;
  final int project;
  final String title;
  final String description;
  final String startDate;
  final String endDate;

  const ProfileFeatureDto({
    required this.id,
    required this.project,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
  });

  ProfileFeatureDto copyWith({
    int? id,
    int? project,
    String? title,
    String? description,
    String? startDate,
    String? endDate,
  }) {
    return ProfileFeatureDto(
      id: id ?? this.id,
      project: project ?? this.project,
      title: title ?? this.title,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'project': project,
      'title': title,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory ProfileFeatureDto.fromMap(Map<String, dynamic> map) {
    return ProfileFeatureDto(
      id: map['id']?.toInt() ?? 0,
      project: map['project']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileFeatureDto.fromJson(String source) =>
      ProfileFeatureDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProfileFeatureDto(id: $id, project: $project, title: $title, description: $description, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileFeatureDto &&
        other.id == id &&
        other.project == project &&
        other.title == title &&
        other.description == description &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        project.hashCode ^
        title.hashCode ^
        description.hashCode ^
        startDate.hashCode ^
        endDate.hashCode;
  }
}
