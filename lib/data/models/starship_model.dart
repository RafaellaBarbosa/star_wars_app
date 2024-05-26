import '../../domain/entities/starship_entity.dart';

class StarshipModel extends StarshipEntity {
  StarshipModel({
    required super.name,
    required super.model,
    required super.manufacturer,
    required super.costInCredits,
    required super.length,
    required super.maxAtmospheringSpeed,
    required super.crew,
    required super.passengers,
    required super.cargoCapacity,
    required super.consumables,
    required super.hyperdriveRating,
    required super.mglt,
    required super.starshipClass,
    required super.url,
  });

  factory StarshipModel.fromJson(Map<String, dynamic> json) {
    return StarshipModel(
      name: json['name'] ?? '',
      model: json['model'] ?? '',
      manufacturer: json['manufacturer'] ?? '',
      costInCredits: json['cost_in_credits'] ?? '',
      length: json['length'] ?? '',
      maxAtmospheringSpeed: json['max_atmosphering_speed'] ?? '',
      crew: json['crew'] ?? '',
      passengers: json['passengers'] ?? '',
      cargoCapacity: json['cargo_capacity'] ?? '',
      consumables: json['consumables'] ?? '',
      hyperdriveRating: json['hyperdrive_rating'] ?? '',
      mglt: json['MGLT'] ?? '',
      starshipClass: json['starship_class'] ?? '',
      url: json['url'] ?? '',
    );
  }
  
}
