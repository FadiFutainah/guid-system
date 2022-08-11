import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/data/entities/child_page_dto.dart';

import 'reference_feature_dto.dart';

@immutable
class ReferenceChildDto {
  final int id;
  final int index;
  final ChildPageDto child;
  final List<ReferenceFeatureDto> features;

  const ReferenceChildDto({
    required this.id,
    required this.index,
    required this.child,
    required this.features,
  });

  ReferenceChildDto copyWith({
    int? id,
    int? index,
    ChildPageDto? child,
    List<ReferenceFeatureDto>? features,
  }) {
    return ReferenceChildDto(
      id: id ?? this.id,
      index: index ?? this.index,
      child: child ?? this.child,
      features: features ?? this.features,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'index': index,
      'child': child.toMap(),
      'features': features.map((x) => x.toMap()).toList(),
    };
  }

  factory ReferenceChildDto.fromMap(Map<String, dynamic> map) {
    return ReferenceChildDto(
      id: map['id']?.toInt() ?? 0,
      index: map['index']?.toInt() ?? 0,
      child: ChildPageDto.fromMap(map['child']),
      features: List<ReferenceFeatureDto>.from(
          map['features']?.map((x) => ReferenceFeatureDto.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReferenceChildDto.fromJson(String source) =>
      ReferenceChildDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReferenceChildDto(id: $id, index: $index, child: $child, features: $features)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReferenceChildDto &&
        other.id == id &&
        other.index == index &&
        other.child == child &&
        listEquals(other.features, features);
  }

  @override
  int get hashCode {
    return id.hashCode ^ index.hashCode ^ child.hashCode ^ features.hashCode;
  }
}
