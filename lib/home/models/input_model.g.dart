// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InputModel _$InputModelFromJson(Map<String, dynamic> json) => InputModel(
      image: json['image'] as String,
      name: json['name'] as String,
      about: json['about'] as String,
      education: json['education'] as String,
      skills: json['skills'] as String,
      language: json['language'] as String,
      organization: json['organization'] as String,
    );

Map<String, dynamic> _$InputModelToJson(InputModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'about': instance.about,
      'education': instance.education,
      'skills': instance.skills,
      'language': instance.language,
      'organization': instance.organization,
    };
