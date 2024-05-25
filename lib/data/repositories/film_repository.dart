import '../datasources/film_datasource.dart';
import '../models/film_model.dart';

class FilmRepository {
  final FilmDataSource dataSource;

  FilmRepository(this.dataSource);

  Future<List<Film>> getFilms() async {
    return await dataSource.fetchFilms();
  }
}
