import '../datasources/starship_datasource.dart';
import '../models/starship_model.dart';

class StarshipRepository {
  final StarshipDataSource dataSource;

  StarshipRepository(this.dataSource);

  Future<List<StarshipModel>> getStarships(int page) async {
    return await dataSource.fetchStarships(page);
  }
}
