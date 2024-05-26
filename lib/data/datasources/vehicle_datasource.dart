import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/vehicle_model.dart';

class VehicleDataSource {
  Future<List<VehicleModel>> fetchVehicles(int page) async {
    final response = await http.get(
      Uri.parse('https://swapi.dev/api/vehicles/?page=$page'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> results = json.decode(response.body)['results'];
      return results.map((json) => VehicleModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load vehicles');
    }
  }
}
