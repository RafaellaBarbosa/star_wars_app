import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character_model.dart';

class CharacterDataSource {
  final String baseUrl = 'https://swapi.dev/api/people/';

  Future<List<CharacterModel>> fetchCharacters({int page = 1}) async {
    final response = await http.get(Uri.parse('$baseUrl?page=$page'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> results = jsonResponse['results'];

      return results.map((json) => CharacterModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
