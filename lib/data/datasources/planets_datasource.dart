import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/planet_model.dart';

class PlanetDataSource {
  PlanetDataSource();

  Future<List<PlanetModel>> fetchPlanets(int page) async {
    final response = await http.get(
      Uri.parse('https://swapi.dev/api/planets/?page=$page'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> results = json.decode(response.body)['results'];
      return results.map((json) => PlanetModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load planets');
    }
  }
}
