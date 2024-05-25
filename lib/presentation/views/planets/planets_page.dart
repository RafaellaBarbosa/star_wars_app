import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_app/presentation/widgets/planets.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/my_theme.dart';

import '../../viewmodels/planets_view_model.dart';

class PlanetsPage extends StatefulWidget {
  const PlanetsPage({super.key});

  @override
  State<PlanetsPage> createState() => _PlanetsPageState();
}

class _PlanetsPageState extends State<PlanetsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<PlanetViewModel>(context, listen: false);
      viewModel.fetchPlanets();
    });

    _scrollController.addListener(() {
      final viewModel = Provider.of<PlanetViewModel>(context, listen: false);

      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        viewModel.loadMorePlanets();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PlanetViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: ThemeColors.iconThemeData,
        title: const Text(
          'Planets',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: AppColors.primaryColor,
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
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 230,
                ),
                itemCount: viewModel.planets.length,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  final planet = viewModel.planets[index];
                  return CardPlanet(
                    name: planet.name,
                    url:
                        'https://starwars-visualguide.com/assets/img/planets/${planet.url.split('/').reversed.skip(1).first}.jpg',
                  );
                },
              ),
      ),
    );
  }
}
