part of 'settings_cubit.dart';

abstract class SettingsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettingsInitial extends SettingsState {
  final String genderValue;

  SettingsInitial({
    required this.genderValue,
  });

  @override
  List<Object?> get props => [genderValue];
}

class Loading extends SettingsState {}

class EditSuccess extends SettingsState {}

class EditFailed extends SettingsState {}
