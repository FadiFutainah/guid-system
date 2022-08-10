import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'package:app/data/entities/small_profile_dto.dart';

@immutable
class MemberDto {
  final int id;
  final String position;
  final bool isAdmin;
  final SmallProfileDto smallProfile;
  const MemberDto({
    required this.id,
    required this.position,
    required this.isAdmin,
    required this.smallProfile,
  });

  MemberDto copyWith({
    int? id,
    String? position,
    bool? isAdmin,
    SmallProfileDto? smallProfile,
  }) {
    return MemberDto(
      id: id ?? this.id,
      position: position ?? this.position,
      isAdmin: isAdmin ?? this.isAdmin,
      smallProfile: smallProfile ?? this.smallProfile,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'position': position,
      'isAdmin': isAdmin,
      'smallProfile': smallProfile.toMap(),
    };
  }

  factory MemberDto.fromMap(Map<String, dynamic> map) {
    return MemberDto(
      id: map['id']?.toInt() ?? 0,
      position: map['position'] ?? '',
      isAdmin: map['isAdmin'] ?? false,
      smallProfile: SmallProfileDto.fromMap(map['smallProfile']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberDto.fromJson(String source) =>
      MemberDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MemberDto(id: $id, position: $position, isAdmin: $isAdmin, smallProfile: $smallProfile)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MemberDto &&
        other.id == id &&
        other.position == position &&
        other.isAdmin == isAdmin &&
        other.smallProfile == smallProfile;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        position.hashCode ^
        isAdmin.hashCode ^
        smallProfile.hashCode;
  }
}
