part of 'profile_dto.dart';

@immutable
class MarkDto {
  final String id;
  final String subjectName;
  final String mark;
  final String date;

  const MarkDto({
    required this.id,
    required this.subjectName,
    required this.mark,
    required this.date,
  });

  MarkDto copyWith({
    String? id,
    String? subjectName,
    String? mark,
    String? date,
  }) {
    return MarkDto(
      id: id ?? this.id,
      subjectName: subjectName ?? this.subjectName,
      mark: mark ?? this.mark,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subject_name': subjectName,
      'mark': mark,
      'date': date,
    };
  }

  factory MarkDto.fromMap(Map<String, dynamic> map) {
    return MarkDto(
      id: map['id'] ?? '',
      subjectName: map['subject_name'] ?? '',
      mark: map['mark'] ?? '',
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MarkDto.fromJson(String source) =>
      MarkDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MarkDto(id: $id, subjectName: $subjectName, mark: $mark, date: $date)';
  }
}
