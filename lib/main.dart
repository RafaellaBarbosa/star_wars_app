import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_app/data/datasources/characters_datasource.dart';
import 'package:star_wars_app/data/datasources/vehicle_datasource.dart';
import 'package:star_wars_app/data/repositories/vehicle_repository.dart';
import 'package:star_wars_app/presentation/views/home/home_page.dart';
import 'package:star_wars_app/presentation/views/planets/planets_page.dart';
import 'package:star_wars_app/presentation/views/splash/splash_page.dart';
import 'package:star_wars_app/presentation/views/vehicle/vehicle_page.dart';

import 'data/datasources/film_datasource.dart';
import 'data/datasources/planets_datasource.dart';
import 'data/datasources/species_datasource.dart';
import 'data/datasources/starship_datasource.dart';
import 'data/repositories/character_repository.dart';
import 'data/repositories/film_repository.dart';
import 'data/repositories/planets_repository.dart';
import 'data/repositories/species_repository.dart';
import 'data/repositories/starship_repository.dart';
import 'presentation/viewmodels/character_view_model.dart';
import 'presentation/viewmodels/film_view_model.dart';
import 'presentation/viewmodels/planets_view_model.dart';
import 'presentation/viewmodels/species_view_model.dart';
import 'presentation/viewmodels/starship_view_model.dart';
import 'presentation/viewmodels/vehicle_view_model.dart';
import 'presentation/views/Species/species_page.dart';
import 'presentation/views/characters/characters_page.dart';
import 'presentation/views/films/films_page.dart';
import 'presentation/views/starships/starships_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CharacterViewModel(
            CharacterRepository(
              CharacterDataSource(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => FilmViewModel(
            FilmRepository(
              FilmDataSource(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => PlanetViewModel(
            PlanetRepository(
              PlanetDataSource(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => SpeciesViewModel(
            SpeciesRepository(
              SpeciesDataSource(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => StarshipViewModel(
            StarshipRepository(
              StarshipDataSource(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => VehicleViewModel(
            VehicleRepository(
              VehicleDataSource(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Star Wars App',
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => const HomePage(),
          '/characters': (context) => const CharactersPage(),
          '/films': (context) => const FilmsPage(),
          '/planets': (context) => const PlanetsPage(),
          '/species': (context) => const SpeciesPage(),
          '/starships': (context) => const StarshipsPage(),
          '/vehicles': (context) => const VehiclePage(),
        },
      ),
    );
  }
}
