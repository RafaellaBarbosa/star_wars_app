import 'package:flutter/material.dart';
import 'package:star_wars_app/presentation/widgets/card_category.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/images.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Categories',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Image.asset(
                AppImages.logo_star_wars,
                width: 91,
                height: 36,
              )
            ],
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter, colors: AppColors.gradient)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(36, 36, 36, 0),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: 130,
                mainAxisSpacing: 32,
              ),
              children: [
                CardCategory(
                  categoryName: 'Characters',
                  pathImage: AppImages.character,
                  onTap: () => Navigator.of(context).pushNamed('/characters'),
                ),
                CardCategory(
                  categoryName: 'Films',
                  pathImage: AppImages.films,
                  onTap: () => Navigator.of(context).pushNamed('/films'),
                ),
                const CardCategory(
                  categoryName: 'Planets',
                  pathImage: AppImages.planets,
                ),
                const CardCategory(
                  categoryName: 'species',
                  pathImage: AppImages.species,
                ),
                const CardCategory(
                  categoryName: 'starships',
                  pathImage: AppImages.starships,
                ),
                const CardCategory(
                  categoryName: 'vehicles',
                  pathImage: AppImages.vehicles,
                ),
              ],
            ),
          ),
        ));
  }
}
