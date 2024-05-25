import 'dart:ui';

import 'package:flutter/material.dart';

class CardCategory extends StatelessWidget {
  final String pathImage;
  final String categoryName;
  final Function()? onTap;

  const CardCategory({
    super.key,
    required this.pathImage,
    required this.categoryName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            height: 130,
            width: 318,
            child: Image.asset(pathImage, fit: BoxFit.cover),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(8),
                child: Text(
                  categoryName,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
