part of 'input_bloc.dart';

class InputEvent extends Equatable {
  const InputEvent();

  @override
  List<Object?> get props => [];
}

class InitialInput extends InputEvent {}

class ChangeInput extends InputEvent {
  final String? name;
  final String? about;
  final String? education;
  final String? language;
  final String? skills;
  final String? organization;
  final String? filePath;

  const ChangeInput({
    this.name,
    this.about,
    this.education,
    this.language,
    this.skills,
    this.organization,
    this.filePath,
  });

  @override
  List<Object?> get props => [
        name,
        about,
        education,
        language,
        skills,
        organization,
        filePath,
      ];
}

class ChangeImageInput extends InputEvent {
  final ImageSource source;

  const ChangeImageInput({required this.source});

  @override
  List<Object> get props => [source];
}
