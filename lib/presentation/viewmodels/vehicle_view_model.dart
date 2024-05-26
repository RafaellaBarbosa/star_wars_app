import 'package:flutter/material.dart';
import '../../data/models/vehicle_model.dart';
import '../../data/repositories/vehicle_repository.dart';

class VehicleViewModel extends ChangeNotifier {
  final VehicleRepository repository;
  List<VehicleModel> _vehicles = [];
  bool _isLoading = false;
  int _currentPage = 1;

  VehicleViewModel(this.repository);

  List<VehicleModel> get vehicles => _vehicles;
  bool get isLoading => _isLoading;

  Future<void> fetchVehicles() async {
    _isLoading = true;
    notifyListeners();

    try {
      final vehicleList = await repository.fetchVehicles(_currentPage);
      _vehicles = vehicleList;
    } catch (e) {
      // handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoreVehicles() async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();

    _currentPage++;
    try {
      final vehicleList = await repository.fetchVehicles(_currentPage);
      _vehicles.addAll(vehicleList);
    } catch (e) {
      // handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
