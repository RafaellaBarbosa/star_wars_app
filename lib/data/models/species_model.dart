import 'package:star_wars_app/domain/entities/species_entity.dart';

class SpeciesModel extends SpeciesEntity {
  SpeciesModel({
    required super.name,
    required super.classification,
    required super.designation,
    required super.averageHeight,
    required super.skinColors,
    required super.hairColors,
    required super.eyeColors,
    required super.averageLifespan,
    required super.homeworld,
    required super.language,
    required super.url,
  });

  factory SpeciesModel.fromJson(Map<String, dynamic> json) {
    return SpeciesModel(
      name: json['name'] ?? '',
      classification: json['classification'] ?? '',
      designation: json['designation'] ?? '',
      averageHeight: json['average_height'] ?? '',
      skinColors: json['skin_colors'] ?? '',
      hairColors: json['hair_colors'] ?? '',
      eyeColors: json['eye_colors'] ?? '',
      averageLifespan: json['average_lifespan'] ?? '',
      homeworld: json['homeworld'] ?? '',
      language: json['language'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
