import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/data/entities/feature_dto.dart';
import 'package:app/data/entities/project_tool_dto.dart';

import 'member_dto.dart';

@immutable
class ProjectDto {
  final int id;
  final String title;
  final String description;
  final String link;
  final String photo;
  final String isCertified;
  final String startDate;
  final String endDate;
  final List<MemberDto> memberships;
  final List<FeatureDto> features;
  final List<ProjectToolDto> tools;
  const ProjectDto({
    required this.id,
    required this.title,
    required this.description,
    required this.link,
    required this.photo,
    required this.isCertified,
    required this.startDate,
    required this.endDate,
    required this.memberships,
    required this.features,
    required this.tools,
  });

  ProjectDto copyWith({
    int? id,
    String? title,
    String? description,
    String? link,
    String? photo,
    String? isCertified,
    String? startDate,
    String? endDate,
    List<MemberDto>? memberships,
    List<FeatureDto>? features,
    List<ProjectToolDto>? tools,
  }) {
    return ProjectDto(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      link: link ?? this.link,
      photo: photo ?? this.photo,
      isCertified: isCertified ?? this.isCertified,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      memberships: memberships ?? this.memberships,
      features: features ?? this.features,
      tools: tools ?? this.tools,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'link': link,
      'photo': photo,
      'isCertified': isCertified,
      'startDate': startDate,
      'endDate': endDate,
      'memberships': memberships.map((x) => x.toMap()).toList(),
      'features': features.map((x) => x.toMap()).toList(),
      'tools': tools.map((x) => x.toMap()).toList(),
    };
  }

  factory ProjectDto.fromMap(Map<String, dynamic> map) {
    return ProjectDto(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      link: map['link'] ?? '',
      photo: map['photo'] ?? '',
      isCertified: map['isCertified'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
      memberships: List<MemberDto>.from(
          map['memberships']?.map((x) => MemberDto.fromMap(x))),
      features: List<FeatureDto>.from(
          map['features']?.map((x) => FeatureDto.fromMap(x))),
      tools: List<ProjectToolDto>.from(
          map['tools']?.map((x) => ProjectToolDto.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectDto.fromJson(String source) =>
      ProjectDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProjectDto(id: $id, title: $title, description: $description, link: $link, photo: $photo, isCertified: $isCertified, startDate: $startDate, endDate: $endDate, memberships: $memberships, features: $features, tools: $tools)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProjectDto &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.link == link &&
        other.photo == photo &&
        other.isCertified == isCertified &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        listEquals(other.memberships, memberships) &&
        listEquals(other.features, features) &&
        listEquals(other.tools, tools);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        link.hashCode ^
        photo.hashCode ^
        isCertified.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        memberships.hashCode ^
        features.hashCode ^
        tools.hashCode;
  }
}
