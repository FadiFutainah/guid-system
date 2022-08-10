import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/data/entities/membership_dto.dart';
import 'package:app/data/entities/profile_tool_dto.dart';

import 'contact_dto.dart';
import 'experience_dto.dart';
import 'mark_dto.dart';

@immutable
class ProfileDto {
  final int userId;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String photo;
  final String address;
  final String services;
  final String preferences;
  final String birthDate;
  final bool isGraduated;
  final String startDate;
  final String graduateDate;
  final String publicLink;
  final int points;
  final List<ContactDto> contacts;
  final List<MarkDto> marks;
  final List<ExperienceDto> experiences;
  final List<MembershipDto> memberships;
  final List<ProfileToolDto> tools;
  const ProfileDto({
    required this.userId,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.photo,
    required this.address,
    required this.services,
    required this.preferences,
    required this.birthDate,
    required this.isGraduated,
    required this.startDate,
    required this.graduateDate,
    required this.publicLink,
    required this.points,
    required this.contacts,
    required this.marks,
    required this.experiences,
    required this.memberships,
    required this.tools,
  });

  ProfileDto copyWith({
    int? userId,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? gender,
    String? photo,
    String? address,
    String? services,
    String? preferences,
    String? birthDate,
    bool? isGraduated,
    String? startDate,
    String? graduateDate,
    String? publicLink,
    int? points,
    List<ContactDto>? contacts,
    List<MarkDto>? marks,
    List<ExperienceDto>? experiences,
    List<MembershipDto>? memberships,
    List<ProfileToolDto>? tools,
  }) {
    return ProfileDto(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      photo: photo ?? this.photo,
      address: address ?? this.address,
      services: services ?? this.services,
      preferences: preferences ?? this.preferences,
      birthDate: birthDate ?? this.birthDate,
      isGraduated: isGraduated ?? this.isGraduated,
      startDate: startDate ?? this.startDate,
      graduateDate: graduateDate ?? this.graduateDate,
      publicLink: publicLink ?? this.publicLink,
      points: points ?? this.points,
      contacts: contacts ?? this.contacts,
      marks: marks ?? this.marks,
      experiences: experiences ?? this.experiences,
      memberships: memberships ?? this.memberships,
      tools: tools ?? this.tools,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'photo': photo,
      'address': address,
      'services': services,
      'preferences': preferences,
      'birthDate': birthDate,
      'isGraduated': isGraduated,
      'startDate': startDate,
      'graduateDate': graduateDate,
      'publicLink': publicLink,
      'points': points,
      'contacts': contacts.map((x) => x.toMap()).toList(),
      'marks': marks.map((x) => x.toMap()).toList(),
      'experiences': experiences.map((x) => x.toMap()).toList(),
      'memberships': memberships.map((x) => x.toMap()).toList(),
      'tools': tools.map((x) => x.toMap()).toList(),
    };
  }

  factory ProfileDto.fromMap(Map<String, dynamic> map) {
    return ProfileDto(
      userId: map['userId']?.toInt() ?? 0,
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      gender: map['gender'] ?? '',
      photo: map['photo'] ?? '',
      address: map['address'] ?? '',
      services: map['services'] ?? '',
      preferences: map['preferences'] ?? '',
      birthDate: map['birthDate'] ?? '',
      isGraduated: map['isGraduated'] ?? false,
      startDate: map['startDate'] ?? '',
      graduateDate: map['graduateDate'] ?? '',
      publicLink: map['publicLink'] ?? '',
      points: map['points']?.toInt() ?? 0,
      contacts: List<ContactDto>.from(
          map['contacts']?.map((x) => ContactDto.fromMap(x))),
      marks: List<MarkDto>.from(map['marks']?.map((x) => MarkDto.fromMap(x))),
      experiences: List<ExperienceDto>.from(
          map['experiences']?.map((x) => ExperienceDto.fromMap(x))),
      memberships: List<MembershipDto>.from(
          map['memberships']?.map((x) => MembershipDto.fromMap(x))),
      tools: List<ProfileToolDto>.from(
          map['tools']?.map((x) => ProfileToolDto.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileDto.fromJson(String source) =>
      ProfileDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProfileDto(userId: $userId, username: $username, email: $email, firstName: $firstName, lastName: $lastName, gender: $gender, photo: $photo, address: $address, services: $services, preferences: $preferences, birthDate: $birthDate, isGraduated: $isGraduated, startDate: $startDate, graduateDate: $graduateDate, publicLink: $publicLink, points: $points, contacts: $contacts, marks: $marks, experiences: $experiences, memberships: $memberships, tools: $tools)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileDto &&
        other.userId == userId &&
        other.username == username &&
        other.email == email &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.gender == gender &&
        other.photo == photo &&
        other.address == address &&
        other.services == services &&
        other.preferences == preferences &&
        other.birthDate == birthDate &&
        other.isGraduated == isGraduated &&
        other.startDate == startDate &&
        other.graduateDate == graduateDate &&
        other.publicLink == publicLink &&
        other.points == points &&
        listEquals(other.contacts, contacts) &&
        listEquals(other.marks, marks) &&
        listEquals(other.experiences, experiences) &&
        listEquals(other.memberships, memberships) &&
        listEquals(other.tools, tools);
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        username.hashCode ^
        email.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        gender.hashCode ^
        photo.hashCode ^
        address.hashCode ^
        services.hashCode ^
        preferences.hashCode ^
        birthDate.hashCode ^
        isGraduated.hashCode ^
        startDate.hashCode ^
        graduateDate.hashCode ^
        publicLink.hashCode ^
        points.hashCode ^
        contacts.hashCode ^
        marks.hashCode ^
        experiences.hashCode ^
        memberships.hashCode ^
        tools.hashCode;
  }
}
