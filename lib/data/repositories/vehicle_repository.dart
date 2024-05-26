import '../datasources/vehicle_datasource.dart';
import '../models/vehicle_model.dart';

class VehicleRepository {
  final VehicleDataSource dataSource;

  VehicleRepository(this.dataSource);

  Future<List<VehicleModel>> fetchVehicles(int page) async {
    return await dataSource.fetchVehicles(page);
  }
}
