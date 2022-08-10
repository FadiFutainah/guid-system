import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class ExperienceDto {
  final int id;
  final String name;
  final String type;
  final String description;
  final String startDate;
  final String endDate;
  final bool isCertified;
  const ExperienceDto({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.isCertified,
  });

  ExperienceDto copyWith({
    int? id,
    String? name,
    String? type,
    String? description,
    String? startDate,
    String? endDate,
    bool? isCertified,
  }) {
    return ExperienceDto(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isCertified: isCertified ?? this.isCertified,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      'isCertified': isCertified,
    };
  }

  factory ExperienceDto.fromMap(Map<String, dynamic> map) {
    return ExperienceDto(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      description: map['description'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
      isCertified: map['isCertified'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExperienceDto.fromJson(String source) =>
      ExperienceDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExperienceDto(id: $id, name: $name, type: $type, description: $description, startDate: $startDate, endDate: $endDate, isCertified: $isCertified)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExperienceDto &&
        other.id == id &&
        other.name == name &&
        other.type == type &&
        other.description == description &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.isCertified == isCertified;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        type.hashCode ^
        description.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        isCertified.hashCode;
  }
}
