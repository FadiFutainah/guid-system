part of 'profile_dto.dart';

@immutable
class ProjectDto {
  final String id;
  final String title;
  final String description;
  final String position;
  final String link;
  final bool isCertified;
  final String startDate;
  final String endDate;
  const ProjectDto({
    required this.id,
    required this.title,
    required this.description,
    required this.position,
    required this.link,
    required this.isCertified,
    required this.startDate,
    required this.endDate,
  });

  ProjectDto copyWith({
    String? id,
    String? title,
    String? description,
    String? position,
    String? link,
    bool? isCertified,
    String? startDate,
    String? endDate,
  }) {
    return ProjectDto(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      position: position ?? this.position,
      link: link ?? this.link,
      isCertified: isCertified ?? this.isCertified,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'position': position,
      'link': link,
      'is_certified': isCertified,
      'start_date': startDate,
      'end_date': endDate,
    };
  }

  factory ProjectDto.fromMap(Map<String, dynamic> map) {
    return ProjectDto(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      position: map['position'] ?? '',
      link: map['link'] ?? '',
      isCertified: map['is_certified'] ?? false,
      startDate: map['start_date'] ?? '',
      endDate: map['end_date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectDto.fromJson(String source) =>
      ProjectDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProjectDto(id: $id, title: $title, description: $description, position: $position, link: $link, isCertified: $isCertified, startDate: $startDate, endDate: $endDate)';
  }
}
