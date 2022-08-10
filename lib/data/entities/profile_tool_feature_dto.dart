import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'package:app/data/entities/profile_feature_dto.dart';

@immutable
class ProfileToolFeatureDto {
  final int id;
  final ProfileFeatureDto feature;
  const ProfileToolFeatureDto({
    required this.id,
    required this.feature,
  });

  ProfileToolFeatureDto copyWith({
    int? id,
    ProfileFeatureDto? feature,
  }) {
    return ProfileToolFeatureDto(
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

  factory ProfileToolFeatureDto.fromMap(Map<String, dynamic> map) {
    return ProfileToolFeatureDto(
      id: map['id']?.toInt() ?? 0,
      feature: ProfileFeatureDto.fromMap(map['feature']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileToolFeatureDto.fromJson(String source) =>
      ProfileToolFeatureDto.fromMap(json.decode(source));

  @override
  String toString() => 'ProfileToolFeatureDto(id: $id, feature: $feature)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileToolFeatureDto &&
        other.id == id &&
        other.feature == feature;
  }

  @override
  int get hashCode => id.hashCode ^ feature.hashCode;
}
