import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_app/core/utils/colors.dart';
import '../../../core/utils/my_theme.dart';
import '../../viewmodels/species_view_model.dart';
import '../../widgets/planets.dart';

class SpeciesPage extends StatefulWidget {
  const SpeciesPage({super.key});

  @override
  State<SpeciesPage> createState() => _SpeciesPageState();
}

class _SpeciesPageState extends State<SpeciesPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<SpeciesViewModel>(context, listen: false);
      viewModel.fetchSpecies();
    });

    _scrollController.addListener(() {
      final viewModel = Provider.of<SpeciesViewModel>(context, listen: false);

      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        viewModel.loadMoreSpecies();
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
    final viewModel = Provider.of<SpeciesViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: ThemeColors.iconThemeData,
        title: const Text(
          'Species',
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
                itemCount: viewModel.species.length,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  final species = viewModel.species[index];
                  return CardPlanet(
                    name: species.name,
                    url:
                        'https://starwars-visualguide.com/assets/img/species/${species.url.split('/').reversed.skip(1).first}.jpg',
                  );
                },
              ),
      ),
    );
  }
}
