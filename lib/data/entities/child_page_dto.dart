import 'dart:convert';

import 'package:flutter/widgets.dart';

@immutable
class ChildPageDto {
  final int id;
  final String title;
  final String type;
  final String background;
  final String icon;
  final String importanceAndAdvantages;
  final String viewTemplate;
  final String adviceAndTools;

  const ChildPageDto({
    required this.id,
    required this.title,
    required this.type,
    required this.background,
    required this.icon,
    required this.importanceAndAdvantages,
    required this.viewTemplate,
    required this.adviceAndTools,
  });

  ChildPageDto copyWith({
    int? id,
    String? title,
    String? type,
    String? background,
    String? icon,
    String? importanceAndAdvantages,
    String? viewTemplate,
    String? adviceAndTools,
  }) {
    return ChildPageDto(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      background: background ?? this.background,
      icon: icon ?? this.icon,
      importanceAndAdvantages:
          importanceAndAdvantages ?? this.importanceAndAdvantages,
      viewTemplate: viewTemplate ?? this.viewTemplate,
      adviceAndTools: adviceAndTools ?? this.adviceAndTools,
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
      'viewTemplate': viewTemplate,
      'adviceAndTools': adviceAndTools,
    };
  }

  factory ChildPageDto.fromMap(Map<String, dynamic> map) {
    return ChildPageDto(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      type: map['type'] ?? '',
      background: map['background'] ?? '',
      icon: map['icon'] ?? '',
      importanceAndAdvantages: map['importanceAndAdvantages'] ?? '',
      viewTemplate: map['viewTemplate'] ?? '',
      adviceAndTools: map['adviceAndTools'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChildPageDto.fromJson(String source) =>
      ChildPageDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChildPageDto(id: $id, title: $title, type: $type, background: $background, icon: $icon, importanceAndAdvantages: $importanceAndAdvantages, viewTemplate: $viewTemplate, adviceAndTools: $adviceAndTools)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChildPageDto &&
        other.id == id &&
        other.title == title &&
        other.type == type &&
        other.background == background &&
        other.icon == icon &&
        other.importanceAndAdvantages == importanceAndAdvantages &&
        other.viewTemplate == viewTemplate &&
        other.adviceAndTools == adviceAndTools;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        type.hashCode ^
        background.hashCode ^
        icon.hashCode ^
        importanceAndAdvantages.hashCode ^
        viewTemplate.hashCode ^
        adviceAndTools.hashCode;
  }
}
