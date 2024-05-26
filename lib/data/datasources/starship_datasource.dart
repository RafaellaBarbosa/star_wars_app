import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/starship_model.dart';

class StarshipDataSource {
  Future<List<StarshipModel>> fetchStarships(int page) async {
    final response = await http.get(
      Uri.parse('https://swapi.dev/api/starships/?page=$page'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> results = json.decode(response.body)['results'];
      return results.map((json) => StarshipModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load starships');
    }
  }
}
