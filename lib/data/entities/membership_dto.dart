import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/data/entities/project_dto.dart';

@immutable
class MembershipDto {
  final int id;
  final String position;
  final bool isAdmin;
  final ProjectDto project;
  const MembershipDto({
    required this.id,
    required this.position,
    required this.isAdmin,
    required this.project,
  });

  MembershipDto copyWith({
    int? id,
    String? position,
    bool? isAdmin,
    ProjectDto? project,
  }) {
    return MembershipDto(
      id: id ?? this.id,
      position: position ?? this.position,
      isAdmin: isAdmin ?? this.isAdmin,
      project: project ?? this.project,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'position': position,
      'isAdmin': isAdmin,
      'project': project.toMap(),
    };
  }

  factory MembershipDto.fromMap(Map<String, dynamic> map) {
    return MembershipDto(
      id: map['id']?.toInt() ?? 0,
      position: map['position'] ?? '',
      isAdmin: map['isAdmin'] ?? false,
      project: ProjectDto.fromMap(map['project']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MembershipDto.fromJson(String source) =>
      MembershipDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MembershipDto(id: $id, position: $position, isAdmin: $isAdmin, project: $project)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MembershipDto &&
        other.id == id &&
        other.position == position &&
        other.isAdmin == isAdmin &&
        other.project == project;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        position.hashCode ^
        isAdmin.hashCode ^
        project.hashCode;
  }
}
