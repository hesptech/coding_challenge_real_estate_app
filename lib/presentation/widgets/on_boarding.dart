import 'package:coding_challenge_real_estate_app/presentation/widgets/on_boarding_slide.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  final controller = PageController(initialPage: 0);
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      final page = controller.page ?? 0;

      if(!endReached && page >= 1.5) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return 
    PageView(
      controller: controller, 
      physics: const BouncingScrollPhysics(),
      children: [
        OnBoardingSlide(
          titlePrimaryColor: 'Looking', 
          titleSecondaryColor: ' for an',
          titleDefaultColor: '\nelegant house this \nis the place',
          paragraph: '\nWelcome friends you \nare looking for us? \nCongratulations you have found us', 
          pathImage: 'assets/images/coding_challenge_bghouse.png',
          endReached: endReached,
          controller: controller,
        ),
        OnBoardingSlide(
          titlePrimaryColor: 'Search', 
          titleSecondaryColor: ' by',
          titleDefaultColor: '\nstreet, city, \nneighborhood',
          paragraph: '\nand many other keywords\n \n', 
          pathImage: 'assets/images/coding_challenge_bghouse.png',
          endReached: endReached,
          controller: controller,
        ),
        OnBoardingSlide(
          titlePrimaryColor: 'Filter', 
          titleSecondaryColor: ' by',
          titleDefaultColor: '\nhouse, apartament, \nprice range',
          paragraph: '\nand many other filters\n \n', 
          pathImage: 'assets/images/coding_challenge_bghouse.png',
          endReached: endReached,
          controller: controller,
        ),
      ],
    );
  }
}
