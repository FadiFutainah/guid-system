import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'package:app/data/entities/small_profile_dto.dart';

@immutable
class MemberDto {
  final int id;
  final String position;
  final bool isAdmin;
  final SmallProfileDto profile;
  const MemberDto({
    required this.id,
    required this.position,
    required this.isAdmin,
    required this.profile,
  });

  MemberDto copyWith({
    int? id,
    String? position,
    bool? isAdmin,
    SmallProfileDto? profile,
  }) {
    return MemberDto(
      id: id ?? this.id,
      position: position ?? this.position,
      isAdmin: isAdmin ?? this.isAdmin,
      profile: profile ?? this.profile,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'position': position,
      'isAdmin': isAdmin,
      'profile': profile.toMap(),
    };
  }

  factory MemberDto.fromMap(Map<String, dynamic> map) {
    return MemberDto(
      id: map['id']?.toInt() ?? 0,
      position: map['position'] ?? '',
      isAdmin: map['isAdmin'] ?? false,
      profile: SmallProfileDto.fromMap(map['profile']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberDto.fromJson(String source) =>
      MemberDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MemberDto(id: $id, position: $position, isAdmin: $isAdmin, profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MemberDto &&
        other.id == id &&
        other.position == position &&
        other.isAdmin == isAdmin &&
        other.profile == profile;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        position.hashCode ^
        isAdmin.hashCode ^
        profile.hashCode;
  }
}
