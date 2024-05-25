import 'package:flutter/material.dart';
import '../../data/models/planet_model.dart';
import '../../data/repositories/planets_repository.dart';

class PlanetViewModel extends ChangeNotifier {
  final PlanetRepository repository;
  List<PlanetModel> planets = [];
  bool isLoading = false;
  int currentPage = 1;

  PlanetViewModel(this.repository);

  Future<void> fetchPlanets() async {
    isLoading = true;
    notifyListeners();

    planets = await repository.getPlanets(currentPage);
    isLoading = false;
    notifyListeners();
  }

  Future<void> loadMorePlanets() async {
    currentPage++;
    final newPlanets = await repository.getPlanets(currentPage);
    planets.addAll(newPlanets);
    notifyListeners();
  }
}
