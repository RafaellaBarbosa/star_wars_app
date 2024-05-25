import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/film_model.dart';

class FilmDataSource {
  final String apiUrl = 'https://swapi.dev/api/films/';

  Future<List<Film>> fetchFilms() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List filmsJson = json.decode(response.body)['results'];
      return filmsJson.map((json) => Film.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load films');
    }
  }
}
