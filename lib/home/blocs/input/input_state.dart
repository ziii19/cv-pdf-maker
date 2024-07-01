part of 'input_bloc.dart';

class InputState extends Equatable {
  const InputState({
    this.image,
    this.name,
    this.about,
    this.education,
    this.skills,
    this.language,
    this.organization,
    this.filePath,
  });

  factory InputState.initial() {
    return const InputState();
  }

  InputState get input {
    return InputState(
        name: name ?? '',
        image: image,
        about: about ?? '',
        education: education ?? '',
        skills: skills ?? '',
        language: language ?? '',
        organization: organization ?? '',
        filePath: filePath ?? '');
  }

  final XFile? image;
  final String? name;
  final String? about;
  final String? education;
  final String? skills;
  final String? language;
  final String? organization;
  final String? filePath;

  InputState copywith(
      {XFile? image,
      String? name,
      String? about,
      String? education,
      String? skills,
      String? language,
      String? organization,
      String? filePath}) {
    return InputState(
      image: image ?? this.image,
      name: name ?? this.name,
      about: about ?? this.about,
      education: education ?? this.education,
      skills: skills ?? this.skills,
      language: language ?? this.language,
      organization: organization ?? this.organization,
      filePath: filePath ?? this.filePath,
    );
  }

  @override
  List<Object?> get props =>
      [image, name, about, education, skills, language, organization, filePath];
}
