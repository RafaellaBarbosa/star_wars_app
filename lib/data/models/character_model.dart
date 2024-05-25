import '../../domain/entities/character_entity.dart';

class CharacterModel extends CharacterEntity {
  CharacterModel({
    required super.name,
    required super.height,
    required super.mass,
    required super.hairColor,
    required super.skinColor,
    required super.eyeColor,
    required super.birthYear,
    required super.gender,
    required super.url,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'],
      height: json['height'],
      mass: json['mass'],
      hairColor: json['hair_color'],
      skinColor: json['skin_color'],
      eyeColor: json['eye_color'],
      birthYear: json['birth_year'],
      gender: json['gender'],
      url: json['url'],
    );
  }
}
