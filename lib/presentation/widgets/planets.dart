import 'package:flutter/material.dart';
import 'package:star_wars_app/core/utils/images.dart';

class CardPlanet extends StatelessWidget {
  const CardPlanet({super.key, required this.name, required this.url});
  final String name;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SizedBox(
            height: 182,
            width: double.maxFinite,
            child: Image.network(
              url,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  AppImages.placeholder,
                  fit: BoxFit.fill,
                );
              },
            ),
          ),
          Flexible(
            child: Text(
              name,
            ),
          ),
        ],
      ),
    );
  }
}
