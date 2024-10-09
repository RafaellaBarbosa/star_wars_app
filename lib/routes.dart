import 'package:flutter/material.dart';
import 'package:star_wars_app/presentation/views/home/home_page.dart';
import 'package:star_wars_app/presentation/views/characters/characters_page.dart';
import 'package:star_wars_app/presentation/views/films/films_page.dart';
import 'package:star_wars_app/presentation/views/planets/planets_page.dart';
import 'package:star_wars_app/presentation/views/species/species_page.dart';
import 'package:star_wars_app/presentation/views/splash/splash_page.dart';
import 'package:star_wars_app/presentation/views/starships/starships_page.dart';
import 'package:star_wars_app/presentation/views/vehicle/vehicle_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const SplashPage(),
    '/home': (context) => const HomePage(),
    '/characters': (context) => const CharactersPage(),
    '/films': (context) => const FilmsPage(),
    '/planets': (context) => const PlanetsPage(),
    '/species': (context) => const SpeciesPage(),
    '/starships': (context) => const StarshipsPage(),
    '/vehicles': (context) => const VehiclePage(),
  };
}
