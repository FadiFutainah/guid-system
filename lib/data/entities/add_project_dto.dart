import 'dart:convert';

class AddProjectDto {
  String position;
  SmallProjectDto project;
  AddProjectDto({
    required this.position,
    required this.project,
  });

  AddProjectDto copyWith({
    String? position,
    SmallProjectDto? project,
  }) {
    return AddProjectDto(
      position: position ?? this.position,
      project: project ?? this.project,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'position': position,
      'project': project.toMap(),
    };
  }

  factory AddProjectDto.fromMap(Map<String, dynamic> map) {
    return AddProjectDto(
      position: map['position'] ?? '',
      project: SmallProjectDto.fromMap(map['project']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddProjectDto.fromJson(String source) =>
      AddProjectDto.fromMap(json.decode(source));

  @override
  String toString() => 'AddProjectDto(position: $position, project: $project)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddProjectDto &&
        other.position == position &&
        other.project == project;
  }

  @override
  int get hashCode => position.hashCode ^ project.hashCode;
}

class SmallProjectDto {
  String title;
  String description;
  String link;
  String photo;
  String startDate;
  String endDate;

  SmallProjectDto({
    required this.title,
    required this.description,
    required this.link,
    required this.photo,
    required this.startDate,
    required this.endDate,
  });

  SmallProjectDto copyWith({
    String? title,
    String? description,
    String? link,
    String? photo,
    String? startDate,
    String? endDate,
  }) {
    return SmallProjectDto(
      title: title ?? this.title,
      description: description ?? this.description,
      link: link ?? this.link,
      photo: photo ?? this.photo,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'link': link,
      'photo': photo,
      'start_date': startDate,
      'end_date': endDate,
    };
  }

  factory SmallProjectDto.fromMap(Map<String, dynamic> map) {
    return SmallProjectDto(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      link: map['link'] ?? '',
      photo: map['photo'] ?? '',
      startDate: map['start_date'] ?? '',
      endDate: map['end_dsate'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SmallProjectDto.fromJson(String source) =>
      SmallProjectDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SmallProjectDto(title: $title, description: $description, link: $link, photo: $photo, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SmallProjectDto &&
        other.title == title &&
        other.description == description &&
        other.link == link &&
        other.photo == photo &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        link.hashCode ^
        photo.hashCode ^
        startDate.hashCode ^
        endDate.hashCode;
  }
}
