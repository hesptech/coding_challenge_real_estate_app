import 'package:flutter/material.dart';
import 'package:coding_challenge_real_estate_app/presentation/widgets/richtext_slides.dart';
import 'package:coding_challenge_real_estate_app/presentation/widgets/on_boarding_button.dart';

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
        _Slide(
          titlePrimaryColor: 'Looking', 
          titleSecondaryColor: ' for an',
          titleDefaultColor: '\nelegant house this \nis the place',
          paragraph: '\nWelcome friends you \nare looking for us? \nCongratulations you have found us', 
          pathImage: 'assets/images/coding_challenge_bghouse.png',
          endReached: endReached,
          controller: controller,
        ),
        _Slide(
          titlePrimaryColor: 'Search', 
          titleSecondaryColor: ' by',
          titleDefaultColor: '\nstreet, city, \nneighborhood',
          paragraph: '\nand many other keywords\n \n', 
          pathImage: 'assets/images/coding_challenge_bghouse.png',
          endReached: endReached,
          controller: controller,
        ),
        _Slide(
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


class _Slide extends StatefulWidget {

  final String titlePrimaryColor;
  final String titleSecondaryColor;
  final String titleDefaultColor;
  final String paragraph;
  final String pathImage;
  final bool endReached;
  final PageController? controller;

  const _Slide({
    required this.titlePrimaryColor, 
    required this.titleSecondaryColor,
    required this.titleDefaultColor, 
    required this.paragraph, 
    required this.pathImage,
    required this.endReached,
    this.controller,
  });

  @override
  State<_Slide> createState() => _SlideState();
}

class _SlideState extends State<_Slide> {
  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: SizedBox(),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
          child: RichtextSlides(
            titlePrimaryColor: widget.titlePrimaryColor, 
            titleSecondaryColor: widget.titleSecondaryColor,
            titleDefaultColor: widget.titleDefaultColor, 
            paragraph: widget.paragraph
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: !widget.endReached 
          ? OnBoardingButton(textButton: 'Exit', controller: widget.controller, endReached: widget.endReached) 
          : OnBoardingButton(textButton: 'Exit', controller: widget.controller, endReached: widget.endReached),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width,
            child: FittedBox(child: Image.asset(widget.pathImage))),
        ),
      ],
    );
  }
}
