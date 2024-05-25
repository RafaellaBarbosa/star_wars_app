import 'package:flutter/material.dart';
import 'package:star_wars_app/core/utils/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Colors.black,
            ],
          ),
        ),
        child: Center(
            child: Image.asset(
          AppImages.logo_star_wars,
          height: 108,
          width: 389,
        )),
      ),
    );
  }
}
