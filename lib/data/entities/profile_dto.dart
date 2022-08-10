import 'dart:convert';

import 'package:flutter/widgets.dart';

part 'contact_dto.dart';
part 'experience_dto.dart';
part 'mark_dto.dart';
part 'project_dto.dart';

@immutable
class ProfileDto {
  final String id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final int points;
  final String photo;
  final String address;
  final String services;
  final String preferences;
  final String birthDate;
  final bool isGraduated;
  final String startDate;
  final String graduateDate;
  final String publicLink;
  final List<ContactDto> contacts;
  final List<MarkDto> marks;
  final List<ExperienceDto> experiences;
  final List<ProjectDto> projects;
  const ProfileDto({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.points,
    required this.photo,
    required this.address,
    required this.services,
    required this.preferences,
    required this.birthDate,
    required this.isGraduated,
    required this.startDate,
    required this.graduateDate,
    required this.publicLink,
    required this.contacts,
    required this.marks,
    required this.experiences,
    required this.projects,
  });

  ProfileDto copyWith({
    String? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? gender,
    int? points,
    String? photo,
    String? address,
    String? services,
    String? preferences,
    String? birthDate,
    bool? isGraduated,
    String? startDate,
    String? graduateDate,
    String? publicLink,
    List<ContactDto>? contacts,
    List<MarkDto>? marks,
    List<ExperienceDto>? experiences,
    List<ProjectDto>? projects,
  }) {
    return ProfileDto(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      points: points ?? this.points,
      photo: photo ?? this.photo,
      address: address ?? this.address,
      services: services ?? this.services,
      preferences: preferences ?? this.preferences,
      birthDate: birthDate ?? this.birthDate,
      isGraduated: isGraduated ?? this.isGraduated,
      startDate: startDate ?? this.startDate,
      graduateDate: graduateDate ?? this.graduateDate,
      publicLink: publicLink ?? this.publicLink,
      contacts: contacts ?? this.contacts,
      marks: marks ?? this.marks,
      experiences: experiences ?? this.experiences,
      projects: projects ?? this.projects,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': id,
      'username': username,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'points': points,
      'photo': photo,
      'address': address,
      'services': services,
      'preferences': preferences,
      'birth_date': birthDate,
      'is_graduated': isGraduated,
      'start_date': startDate,
      'graduate_date': graduateDate,
      'public_link': publicLink,
      'contacts': contacts.map((x) => x.toMap()).toList(),
      'marks': marks.map((x) => x.toMap()).toList(),
      'experiences': experiences.map((x) => x.toMap()).toList(),
      'projects': projects.map((x) => x.toMap()).toList(),
    };
  }

  factory ProfileDto.fromMap(Map<String, dynamic> map) {
    return ProfileDto(
      id: map['user_id'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      gender: map['gender'] ?? '',
      points: map['points']?.toInt() ?? 0,
      photo: map['photo'] ?? '',
      address: map['address'] ?? '',
      services: map['services'] ?? '',
      preferences: map['preferences'] ?? '',
      birthDate: map['birth_date'] ?? '',
      isGraduated: map['is_graduated'] ?? false,
      startDate: map['start_date'] ?? '',
      graduateDate: map['graduate_date'] ?? '',
      publicLink: map['public_link'] ?? '',
      contacts: List<ContactDto>.from(
          map['contacts']?.map((x) => ContactDto.fromMap(x))),
      marks: List<MarkDto>.from(map['marks']?.map((x) => MarkDto.fromMap(x))),
      experiences: List<ExperienceDto>.from(
          map['experiences']?.map((x) => ExperienceDto.fromMap(x))),
      projects: List<ProjectDto>.from(
          map['projects']?.map((x) => ProjectDto.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileDto.fromJson(String source) =>
      ProfileDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProfileDto(id: $id, username: $username, email: $email, firstName: $firstName, lastName: $lastName, gender: $gender, points: $points, photo: $photo, address: $address, services: $services, preferences: $preferences, birthDate: $birthDate, isgraduated: $isGraduated, startDate: $startDate, graduateDate: $graduateDate, publicLink: $publicLink, contacts: $contacts, marks: $marks, experiences: $experiences, projects: $projects)';
  }
}
