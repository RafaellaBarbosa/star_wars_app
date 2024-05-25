import 'package:flutter/material.dart';
import 'package:star_wars_app/core/utils/colors.dart';

class CardFilm extends StatelessWidget {
  const CardFilm({
    super.key,
    required this.title,
    required this.director,
    required this.producer,
    required this.releaseDate,
  });

  final String title;
  final String director;
  final String producer;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.transparent,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
              color: AppColors.crawlYellow, fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Director: ',
                  style: TextStyle(
                    color: AppColors.crawlYellow,
                  ),
                ),
                Text(
                  director,
                  style: const TextStyle(color: AppColors.hoth),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Producer: ',
                  style: TextStyle(
                    color: AppColors.crawlYellow,
                  ),
                ),
                Expanded(
                  child: Text(
                    producer,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: AppColors.hoth),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Release Data: ',
                  style: TextStyle(color: Colors.yellow),
                ),
                Text(
                  releaseDate,
                  style: const TextStyle(color: AppColors.hoth),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
