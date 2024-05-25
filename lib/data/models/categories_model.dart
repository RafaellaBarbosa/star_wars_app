import '../../domain/entities/categories_entity.dart';

class CategoriesModel extends Categories {
  CategoriesModel({
    required super.films,
    required super.people,
    required super.planets,
    required super.species,
    required super.starships,
    required super.vehicles,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      films: json['films'],
      people: json['people'],
      planets: json['planets'],
      species: json['species'],
      starships: json['starships'],
      vehicles: json['vehicles'],
    );
  }
}
