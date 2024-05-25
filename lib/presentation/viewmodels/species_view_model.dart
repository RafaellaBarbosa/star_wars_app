import 'package:flutter/material.dart';
import '../../data/models/species_model.dart';
import '../../data/repositories/species_repository.dart';

class SpeciesViewModel extends ChangeNotifier {
  final SpeciesRepository repository;
  List<SpeciesModel> species = [];
  bool isLoading = false;
  int currentPage = 1;

  SpeciesViewModel(this.repository);

  Future<void> fetchSpecies() async {
    isLoading = true;
    notifyListeners();

    species = await repository.getSpecies(currentPage);
    isLoading = false;
    notifyListeners();
  }

  Future<void> loadMoreSpecies() async {
    currentPage++;
    final newSpecies = await repository.getSpecies(currentPage);
    species.addAll(newSpecies);
    notifyListeners();
  }
}
