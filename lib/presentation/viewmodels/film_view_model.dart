import 'package:flutter/material.dart';
import '../../data/models/film_model.dart';
import '../../data/repositories/film_repository.dart';

class FilmViewModel extends ChangeNotifier {
  final FilmRepository repository;
  List<Film> _films = [];
  bool _isLoading = false;

  FilmViewModel(this.repository);

  List<Film> get films => _films;
  bool get isLoading => _isLoading;

  Future<void> fetchFilms() async {
    _isLoading = true;
    notifyListeners();

    _films = await repository.getFilms();

    _isLoading = false;
    notifyListeners();
  }
}
