part of 'profile_dto.dart';

@immutable
class ExperienceDto {
  final String id;
  final String name;
  final String type;
  final String description;
  final String startDate;
  final String endDate;
  final bool isCertified;
  const ExperienceDto({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.isCertified,
  });

  ExperienceDto copyWith({
    String? id,
    String? name,
    String? type,
    String? description,
    String? startDate,
    String? endDate,
    bool? isCertified,
  }) {
    return ExperienceDto(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isCertified: isCertified ?? this.isCertified,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'description': description,
      'start_date': startDate,
      'end_date': endDate,
      'is_certified': isCertified,
    };
  }

  factory ExperienceDto.fromMap(Map<String, dynamic> map) {
    return ExperienceDto(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      description: map['description'] ?? '',
      startDate: map['start_date'] ?? '',
      endDate: map['end_date'] ?? '',
      isCertified: map['is_certified'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExperienceDto.fromJson(String source) =>
      ExperienceDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExperienceDto(id: $id, name: $name, type: $type, description: $description, startDate: $startDate, endDate: $endDate, isCertified: $isCertified)';
  }
}
