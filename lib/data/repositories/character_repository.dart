import '../datasources/characters_datasource.dart';
import '../models/character_model.dart';

class CharacterRepository {
  final CharacterDataSource dataSource;

  CharacterRepository(this.dataSource);

  Future<List<CharacterModel>> getCharacters({int page = 1}) async {
    return await dataSource.fetchCharacters(page: page);
  }
}
