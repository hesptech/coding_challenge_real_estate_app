import 'package:flutter/material.dart';
import 'package:coding_challenge_real_estate_app/presentation/widgets/on_boarding.dart';

class HomeScreen extends StatelessWidget {

  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Image titleImage = Image.asset('assets/images/coding_challenge_logo.png', fit: BoxFit.cover);

    return Scaffold(
      appBar: AppBar(
        title: titleImage,
      ),
      body: const OnBoarding()
    );
  }
}