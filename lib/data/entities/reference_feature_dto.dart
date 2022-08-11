import 'dart:convert';

import 'package:app/data/entities/page_feature_dto.dart';
import 'package:flutter/widgets.dart';

@immutable
class ReferenceFeatureDto {
  final int id;
  final String value;
  final PageFeatureDto feature;

  const ReferenceFeatureDto({
    required this.id,
    required this.value,
    required this.feature,
  });

  ReferenceFeatureDto copyWith({
    int? id,
    String? value,
    PageFeatureDto? feature,
  }) {
    return ReferenceFeatureDto(
      id: id ?? this.id,
      value: value ?? this.value,
      feature: feature ?? this.feature,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value,
      'feature': feature.toMap(),
    };
  }

  factory ReferenceFeatureDto.fromMap(Map<String, dynamic> map) {
    return ReferenceFeatureDto(
      id: map['id']?.toInt() ?? 0,
      value: map['value'] ?? '',
      feature: PageFeatureDto.fromMap(map['feature']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReferenceFeatureDto.fromJson(String source) =>
      ReferenceFeatureDto.fromMap(json.decode(source));

  @override
  String toString() =>
      'ReferenceFeatureDto(id: $id, value: $value, feature: $feature)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReferenceFeatureDto &&
        other.id == id &&
        other.value == value &&
        other.feature == feature;
  }

  @override
  int get hashCode => id.hashCode ^ value.hashCode ^ feature.hashCode;
}
