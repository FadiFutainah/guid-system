import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/data/entities/dependency_child_dto.dart';
import 'package:app/data/entities/page_content_dto.dart';
import 'package:app/data/entities/page_feature_dto.dart';

import 'reference_child_dto.dart';

@immutable
class PageDto {
  final int id;
  final String title;
  final String type;
  final String background;
  final String icon;
  final String importanceAndAdvantages;
  final String adviceAndTools;
  final bool isFinished;
  final List<PageContentDto> contents;
  final List<PageFeatureDto> features;
  final List<DependencyChildDto> dependencyChildren;
  final List<ReferenceChildDto> referenceChildren;
  const PageDto({
    required this.id,
    required this.title,
    required this.type,
    required this.background,
    required this.icon,
    required this.importanceAndAdvantages,
    required this.adviceAndTools,
    required this.isFinished,
    required this.contents,
    required this.features,
    required this.dependencyChildren,
    required this.referenceChildren,
  });

  PageDto copyWith({
    int? id,
    String? title,
    String? type,
    String? background,
    String? icon,
    String? importanceAndAdvantages,
    String? adviceAndTools,
    bool? isFinished,
    List<PageContentDto>? contents,
    List<PageFeatureDto>? features,
    List<DependencyChildDto>? dependencyChildren,
    List<ReferenceChildDto>? referenceChildren,
  }) {
    return PageDto(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      background: background ?? this.background,
      icon: icon ?? this.icon,
      importanceAndAdvantages:
          importanceAndAdvantages ?? this.importanceAndAdvantages,
      adviceAndTools: adviceAndTools ?? this.adviceAndTools,
      isFinished: isFinished ?? this.isFinished,
      contents: contents ?? this.contents,
      features: features ?? this.features,
      dependencyChildren: dependencyChildren ?? this.dependencyChildren,
      referenceChildren: referenceChildren ?? this.referenceChildren,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'background': background,
      'icon': icon,
      'importanceAndAdvantages': importanceAndAdvantages,
      'adviceAndTools': adviceAndTools,
      'isFinished': isFinished,
      'contents': contents.map((x) => x.toMap()).toList(),
      'features': features.map((x) => x.toMap()).toList(),
      'dependencyChildren': dependencyChildren.map((x) => x.toMap()).toList(),
      'referenceChildren': referenceChildren.map((x) => x.toMap()).toList(),
    };
  }

  factory PageDto.fromMap(Map<String, dynamic> map) {
    return PageDto(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      type: map['type'] ?? '',
      background: map['background'] ?? '',
      icon: map['icon'] ?? '',
      importanceAndAdvantages: map['importanceAndAdvantages'] ?? '',
      adviceAndTools: map['adviceAndTools'] ?? '',
      isFinished: map['isFinished'] ?? false,
      contents: List<PageContentDto>.from(
          map['contents']?.map((x) => PageContentDto.fromMap(x))),
      features: List<PageFeatureDto>.from(
          map['features']?.map((x) => PageFeatureDto.fromMap(x))),
      dependencyChildren: List<DependencyChildDto>.from(
          map['dependencyChildren']?.map((x) => DependencyChildDto.fromMap(x))),
      referenceChildren: List<ReferenceChildDto>.from(
          map['referenceChildren']?.map((x) => ReferenceChildDto.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PageDto.fromJson(String source) =>
      PageDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PageDto(id: $id, title: $title, type: $type, background: $background, icon: $icon, importanceAndAdvantages: $importanceAndAdvantages, adviceAndTools: $adviceAndTools, isFinished: $isFinished, contents: $contents, features: $features, dependencyChildren: $dependencyChildren, referenceChildren: $referenceChildren)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PageDto &&
        other.id == id &&
        other.title == title &&
        other.type == type &&
        other.background == background &&
        other.icon == icon &&
        other.importanceAndAdvantages == importanceAndAdvantages &&
        other.adviceAndTools == adviceAndTools &&
        other.isFinished == isFinished &&
        listEquals(other.contents, contents) &&
        listEquals(other.features, features) &&
        listEquals(other.dependencyChildren, dependencyChildren) &&
        listEquals(other.referenceChildren, referenceChildren);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        type.hashCode ^
        background.hashCode ^
        icon.hashCode ^
        importanceAndAdvantages.hashCode ^
        adviceAndTools.hashCode ^
        isFinished.hashCode ^
        contents.hashCode ^
        features.hashCode ^
        dependencyChildren.hashCode ^
        referenceChildren.hashCode;
  }
}
