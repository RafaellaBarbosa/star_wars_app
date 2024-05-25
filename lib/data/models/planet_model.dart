import 'package:star_wars_app/domain/entities/planet_entity.dart';

class PlanetModel extends PlanetEntity {
  PlanetModel({
    required super.name,
    required super.climate,
    required super.terrain,
    required super.population,
    required super.surfaceWater,
    required super.gravity,
    required super.diameter,
    required super.orbitalPeriod,
    required super.rotationPeriod,
    required super.url,
  });

  factory PlanetModel.fromJson(Map<String, dynamic> json) {
    return PlanetModel(
      name: json['name'],
      climate: json['climate'],
      terrain: json['terrain'],
      population: json['population'],
      surfaceWater: json['surface_water'],
      gravity: json['gravity'],
      diameter: json['diameter'],
      orbitalPeriod: json['orbital_period'],
      rotationPeriod: json['rotation_period'],
      url: json['url'],
    );
  }
}
