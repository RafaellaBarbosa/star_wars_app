import 'package:star_wars_app/domain/entities/vehicle_entity.dart';

class VehicleModel extends VehicleEntity {
  VehicleModel(
      {required super.name,
      required super.model,
      required super.manufacturer,
      required super.costInCredits,
      required super.length,
      required super.maxAtmospheringSpeed,
      required super.crew,
      required super.passengers,
      required super.cargoCapacity,
      required super.consumables,
      required super.vehicleClass,
      required super.url});

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      name: json['name'],
      model: json['model'],
      manufacturer: json['manufacturer'],
      costInCredits: json['cost_in_credits'],
      length: json['length'],
      maxAtmospheringSpeed: json['max_atmosphering_speed'],
      crew: json['crew'],
      passengers: json['passengers'],
      cargoCapacity: json['cargo_capacity'],
      consumables: json['consumables'],
      vehicleClass: json['vehicle_class'],
      url: json['url'],
    );
  }

  String get imageUrl {
    final id = Uri.parse(url).pathSegments[2];
    return 'https://starwars-visualguide.com/assets/img/vehicles/$id.jpg';
  }
}
