import 'dart:convert';

class PageFeatureDto {
  int id;
  String name;

  PageFeatureDto({
    required this.id,
    required this.name,
  });

  PageFeatureDto copyWith({
    int? id,
    String? name,
  }) {
    return PageFeatureDto(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory PageFeatureDto.fromMap(Map<String, dynamic> map) {
    return PageFeatureDto(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PageFeatureDto.fromJson(String source) =>
      PageFeatureDto.fromMap(json.decode(source));

  @override
  String toString() => 'PageFeatureDto(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PageFeatureDto && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
