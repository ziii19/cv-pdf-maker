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
  });

  factory InputState.initial() {
    return const InputState();
  }

  final String? image;
  final String? name;
  final String? about;
  final String? education;
  final String? skills;
  final String? language;
  final String? organization;

  InputState copywith({
    String? image,
    String? name,
    String? about,
    String? education,
    String? skills,
    String? language,
    String? organization,
  }) {
    return InputState(
      image: image ?? this.image,
      name: name ?? this.name,
      about: about ?? this.about,
      education: education ?? this.education,
      skills: skills ?? this.skills,
      language: language ?? this.language,
      organization: organization ?? this.organization,
    );
  }

  @override
  List<Object?> get props =>
      [image, name, about, education, skills, language, organization];
}
