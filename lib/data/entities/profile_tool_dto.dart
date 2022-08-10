import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/data/entities/profile_tool_feature_dto.dart';

@immutable
class ProfileToolDto {
  final int id;
  final String title;
  final List<ProfileToolFeatureDto> toolFeatures;
  const ProfileToolDto({
    required this.id,
    required this.title,
    required this.toolFeatures,
  });

  ProfileToolDto copyWith({
    int? id,
    String? title,
    List<ProfileToolFeatureDto>? toolFeatures,
  }) {
    return ProfileToolDto(
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

  factory ProfileToolDto.fromMap(Map<String, dynamic> map) {
    return ProfileToolDto(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      toolFeatures: List<ProfileToolFeatureDto>.from(
          map['toolFeatures']?.map((x) => ProfileToolFeatureDto.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileToolDto.fromJson(String source) =>
      ProfileToolDto.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProfileToolDto(id: $id, title: $title, toolFeatures: $toolFeatures)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileToolDto &&
        other.id == id &&
        other.title == title &&
        listEquals(other.toolFeatures, toolFeatures);
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ toolFeatures.hashCode;
}
