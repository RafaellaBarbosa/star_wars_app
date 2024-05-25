import '../datasources/planets_datasource.dart';
import '../models/planet_model.dart';

class PlanetRepository {
  final PlanetDataSource remoteDataSource;

  PlanetRepository(this.remoteDataSource);

  Future<List<PlanetModel>> getPlanets(int page) async {
    return await remoteDataSource.fetchPlanets(page);
  }
}
