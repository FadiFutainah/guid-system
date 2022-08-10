import 'dart:convert';

import 'package:flutter/widgets.dart';

@immutable
class ToolDto {
  final int id;
  final Tool tool;
  const ToolDto({
    required this.id,
    required this.tool,
  });

  ToolDto copyWith({
    int? id,
    Tool? tool,
  }) {
    return ToolDto(
      id: id ?? this.id,
      tool: tool ?? this.tool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tool': tool.toMap(),
    };
  }

  factory ToolDto.fromMap(Map<String, dynamic> map) {
    return ToolDto(
      id: map['id']?.toInt() ?? 0,
      tool: Tool.fromMap(map['tool']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ToolDto.fromJson(String source) =>
      ToolDto.fromMap(json.decode(source));

  @override
  String toString() => 'ToolDto(id: $id, tool: $tool)';
}

@immutable
class Tool {
  final int id;
  final String title;
  const Tool({
    required this.id,
    required this.title,
  });

  Tool copyWith({
    int? id,
    String? title,
  }) {
    return Tool(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory Tool.fromMap(Map<String, dynamic> map) {
    return Tool(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Tool.fromJson(String source) => Tool.fromMap(json.decode(source));

  @override
  String toString() => 'Tool(id: $id, title: $title)';
}
