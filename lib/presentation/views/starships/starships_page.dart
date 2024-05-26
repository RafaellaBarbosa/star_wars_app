import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_app/presentation/widgets/planets.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/my_theme.dart';
import '../../viewmodels/starship_view_model.dart';

class StarshipsPage extends StatefulWidget {
  const StarshipsPage({super.key});

  @override
  State<StarshipsPage> createState() => _StarshipsPageState();
}

class _StarshipsPageState extends State<StarshipsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<StarshipViewModel>(context, listen: false);
      viewModel.fetchStarships();
    });

    _scrollController.addListener(() {
      final viewModel = Provider.of<StarshipViewModel>(context, listen: false);

      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        viewModel.loadMoreStarships();
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
    final viewModel = Provider.of<StarshipViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: ThemeColors.iconThemeData,
        title: const Text(
          'Starships',
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
                itemCount: viewModel.starships.length,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  final species = viewModel.starships[index];
                  return CardPlanet(
                    name: species.name,
                    url:
                        'https://starwars-visualguide.com/assets/img/starships/${species.url.split('/').reversed.skip(1).first}.jpg',
                  );
                },
              ),
      ),
    );
  }
}
