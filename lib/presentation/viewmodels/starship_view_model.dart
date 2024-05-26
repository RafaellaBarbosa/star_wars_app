import 'package:flutter/material.dart';
import '../../data/models/starship_model.dart';
import '../../data/repositories/starship_repository.dart';

class StarshipViewModel extends ChangeNotifier {
  final StarshipRepository repository;
  List<StarshipModel> starships = [];
  bool isLoading = false;
  int currentPage = 1;

  StarshipViewModel(this.repository);

  Future<void> fetchStarships() async {
    isLoading = true;
    notifyListeners();

    try {
      starships = await repository.getStarships(currentPage);
    } catch (e) {
      // Handle error
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoreStarships() async {
    currentPage++;
    try {
      final newStarships = await repository.getStarships(currentPage);
      starships.addAll(newStarships);
    } catch (e) {
      // Handle error
    } finally {
      notifyListeners();
    }
  }
}
