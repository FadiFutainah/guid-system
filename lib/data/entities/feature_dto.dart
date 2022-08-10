import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:app/data/entities/tool_dto.dart';

@immutable
class FeatureDto {
  final int id;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final List<ToolDto> featureTools;
  const FeatureDto({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.featureTools,
  });

  FeatureDto copyWith({
    int? id,
    String? title,
    String? description,
    String? startDate,
    String? endDate,
    List<ToolDto>? featureTools,
  }) {
    return FeatureDto(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      featureTools: featureTools ?? this.featureTools,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      'featureTools': featureTools.map((x) => x.toMap()).toList(),
    };
  }

  factory FeatureDto.fromMap(Map<String, dynamic> map) {
    return FeatureDto(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
      featureTools: List<ToolDto>.from(
          map['featureTools']?.map((x) => ToolDto.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FeatureDto.fromJson(String source) =>
      FeatureDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FeatureDto(id: $id, title: $title, description: $description, startDate: $startDate, endDate: $endDate, featureTools: $featureTools)';
  }
}
