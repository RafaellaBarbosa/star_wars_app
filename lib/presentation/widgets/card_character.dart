import 'package:flutter/material.dart';

import '../../data/models/character_model.dart';

class CharacterCard extends StatelessWidget {
  final CharacterModel character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.network(
              'https://starwars-visualguide.com/assets/img/characters/${character.url.split('/').reversed.skip(1).first}.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            character.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
