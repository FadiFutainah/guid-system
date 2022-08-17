import 'dart:convert';

class TagDto {
  int id;
  $TagDto tag;
  int contentType;
  int objectId;
  TagDto({
    required this.id,
    required this.tag,
    required this.contentType,
    required this.objectId,
  });

  TagDto copyWith({
    int? id,
    $TagDto? tag,
    int? contentType,
    int? objectId,
  }) {
    return TagDto(
      id: id ?? this.id,
      tag: tag ?? this.tag,
      contentType: contentType ?? this.contentType,
      objectId: objectId ?? this.objectId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tag': tag.toMap(),
      'contentType': contentType,
      'objectId': objectId,
    };
  }

  factory TagDto.fromMap(Map<String, dynamic> map) {
    return TagDto(
      id: map['id']?.toInt() ?? 0,
      tag: $TagDto.fromMap(map['tag']),
      contentType: map['contentType']?.toInt() ?? 0,
      objectId: map['objectId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TagDto.fromJson(String source) => TagDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TagDto(id: $id, tag: $tag, contentType: $contentType, objectId: $objectId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TagDto &&
        other.id == id &&
        other.tag == tag &&
        other.contentType == contentType &&
        other.objectId == objectId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        tag.hashCode ^
        contentType.hashCode ^
        objectId.hashCode;
  }
}

class $TagDto {
  int id;
  String name;
  int numberOfUses;
  $TagDto({
    required this.id,
    required this.name,
    required this.numberOfUses,
  });

  $TagDto copyWith({
    int? id,
    String? name,
    int? numberOfUses,
  }) {
    return $TagDto(
      id: id ?? this.id,
      name: name ?? this.name,
      numberOfUses: numberOfUses ?? this.numberOfUses,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'numberOfUses': numberOfUses,
    };
  }

  factory $TagDto.fromMap(Map<String, dynamic> map) {
    return $TagDto(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      numberOfUses: map['numberOfUses']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory $TagDto.fromJson(String source) =>
      $TagDto.fromMap(json.decode(source));

  @override
  String toString() =>
      '$TagDto(id: $id, name: $name, numberOfUses: $numberOfUses)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is $TagDto &&
        other.id == id &&
        other.name == name &&
        other.numberOfUses == numberOfUses;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ numberOfUses.hashCode;
}
