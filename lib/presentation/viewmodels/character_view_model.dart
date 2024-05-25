import 'package:flutter/material.dart';
import '../../data/models/character_model.dart';
import '../../data/repositories/character_repository.dart';

class CharacterViewModel extends ChangeNotifier {
  final CharacterRepository repository;

  CharacterViewModel(this.repository);

  List<CharacterModel> _characters = [];
  List<CharacterModel> get characters => _characters;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _currentPage = 1;
  bool _hasMoreCharacters = true;

  Future<void> fetchCharacters() async {
    _isLoading = true;
    notifyListeners();

    try {
      _characters = await repository.getCharacters(page: _currentPage);
    } catch (e) {
      // Handle error here
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoreCharacters() async {
    if (!_hasMoreCharacters || _isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      _currentPage++;
      final newCharacters = await repository.getCharacters(page: _currentPage);
      if (newCharacters.isEmpty) {
        _hasMoreCharacters = false;
      } else {
        _characters.addAll(newCharacters);
      }
    } catch (e) {
      // Handle error here
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
