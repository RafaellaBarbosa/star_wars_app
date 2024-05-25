import '../datasources/species_data_source.dart';
import '../models/species_model.dart';

class SpeciesRepository {
  final SpeciesDataSource remoteDataSource;

  SpeciesRepository(this.remoteDataSource);

  Future<List<SpeciesModel>> getSpecies(int page) async {
    return await remoteDataSource.fetchSpecies(page);
  }
}
