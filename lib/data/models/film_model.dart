import '../../domain/entities/film_entity.dart';

class Film extends FilmEntity {
  Film({
    required super.title,
    required super.director,
    required super.producer,
    required super.releaseDate,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json['title'],
      director: json['director'],
      producer: json['producer'],
      releaseDate: json['release_date'],
    );
  }
}
