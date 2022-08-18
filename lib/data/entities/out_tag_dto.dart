import 'dart:convert';

class OutTagDto {
  int id;
  String name;
  int numberOfUses;
  OutTagDto({
    required this.id,
    required this.name,
    required this.numberOfUses,
  });

  OutTagDto copyWith({
    int? id,
    String? name,
    int? numberOfUses,
  }) {
    return OutTagDto(
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

  factory OutTagDto.fromMap(Map<String, dynamic> map) {
    return OutTagDto(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      numberOfUses: map['numberOfUses']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OutTagDto.fromJson(String source) =>
      OutTagDto.fromMap(json.decode(source));

  @override
  String toString() =>
      'OutTagDto(id: $id, name: $name, numberOfUses: $numberOfUses)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OutTagDto &&
        other.id == id &&
        other.name == name &&
        other.numberOfUses == numberOfUses;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ numberOfUses.hashCode;
}
