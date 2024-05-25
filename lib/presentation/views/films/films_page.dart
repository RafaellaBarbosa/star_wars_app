import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_app/core/utils/colors.dart';
import 'package:star_wars_app/presentation/widgets/card_film.dart';
import '../../../core/utils/my_theme.dart';
import '../../viewmodels/film_view_model.dart';

class FilmsPage extends StatefulWidget {
  const FilmsPage({super.key});

  @override
  State<FilmsPage> createState() => _FilmsPageState();
}

class _FilmsPageState extends State<FilmsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<FilmViewModel>(context, listen: false);
      viewModel.fetchFilms();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FilmViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: ThemeColors.iconThemeData,
        title: const Text(
          'Films',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: AppColors.gradient,
          ),
        ),
        child: viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: viewModel.films.length,
                itemBuilder: (context, index) {
                  final film = viewModel.films[index];
                  return CardFilm(
                    title: film.title,
                    director: film.director,
                    producer: film.producer,
                    releaseDate: film.releaseDate,
                  );
                },
              ),
      ),
    );
  }
}
