import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'input_model.g.dart';

@JsonSerializable()
class InputModel extends Equatable {
  final String image;
  final String name;
  final String about;
  final String education;
  final String skills;
  final String language;
  final String organization;

  const InputModel({
    required this.image,
    required this.name,
    required this.about,
    required this.education,
    required this.skills,
    required this.language,
    required this.organization,
  });

  factory InputModel.fromJson(Map<String, dynamic> json) =>
      _$InputModelFromJson(json);

  Map<String, dynamic> toJson() => _$InputModelToJson(this);

  @override
  List<Object?> get props =>
      [image, name, about, education, skills, language, organization];
}
