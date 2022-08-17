part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class InitialState extends ProfileState {}

class Loading extends ProfileState {}

class Success extends ProfileState {
  final ProjectModel? project;
  final bool projectView;
  final ProfileModel profile;
  final bool experiencesExpanded;
  final bool toolsExpanded;
  final bool marksExpanded;

  Success(this.profile, this.project, this.projectView,
      this.experiencesExpanded, this.toolsExpanded, this.marksExpanded);

  @override
  List<Object?> get props => [
        profile,
        project,
        projectView,
        experiencesExpanded,
        toolsExpanded,
        marksExpanded,
      ];

  Success copyWith({
    ProjectModel? project,
    bool? projectView,
    ProfileModel? profile,
    bool? experiencesExpanded,
    bool? toolsExpanded,
    bool? marksExpanded,
  }) {
    return Success(
      profile ?? this.profile,
      project ?? this.project,
      projectView ?? this.projectView,
      experiencesExpanded ?? this.experiencesExpanded,
      toolsExpanded ?? this.toolsExpanded,
      marksExpanded ?? this.marksExpanded,
    );
  }
}

class Failed extends ProfileState {
  final String message;

  Failed(this.message);

  @override
  List<Object?> get props => [message];
}
