import 'dart:convert';

import 'package:app/data/entities/child_page_dto.dart';
import 'package:flutter/widgets.dart';

@immutable
class DependencyChildDto {
  final int id;
  final ChildPageDto child;

  const DependencyChildDto({
    required this.id,
    required this.child,
  });

  DependencyChildDto copyWith({
    int? id,
    ChildPageDto? child,
  }) {
    return DependencyChildDto(
      id: id ?? this.id,
      child: child ?? this.child,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'child': child.toMap(),
    };
  }

  factory DependencyChildDto.fromMap(Map<String, dynamic> map) {
    return DependencyChildDto(
      id: map['id']?.toInt() ?? 0,
      child: ChildPageDto.fromMap(map['child']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DependencyChildDto.fromJson(String source) =>
      DependencyChildDto.fromMap(json.decode(source));

  @override
  String toString() => 'DependencyChildDto(id: $id, child: $child)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DependencyChildDto &&
        other.id == id &&
        other.child == child;
  }

  @override
  int get hashCode => id.hashCode ^ child.hashCode;
}
