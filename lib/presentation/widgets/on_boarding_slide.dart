import 'package:flutter/material.dart';
import 'package:coding_challenge_real_estate_app/presentation/widgets/richtext_slides.dart';
import 'package:coding_challenge_real_estate_app/presentation/widgets/on_boarding_button.dart';


class OnBoardingSlide extends StatefulWidget {

  final String titlePrimaryColor;
  final String titleSecondaryColor;
  final String titleDefaultColor;
  final String paragraph;
  final String pathImage;
  final bool endReached;
  final PageController? controller;

  const OnBoardingSlide({super.key, 
    required this.titlePrimaryColor, 
    required this.titleSecondaryColor,
    required this.titleDefaultColor, 
    required this.paragraph, 
    required this.pathImage,
    required this.endReached,
    this.controller,
  });

  @override
  State<OnBoardingSlide> createState() => OnBoardingSlideState();
}

class OnBoardingSlideState extends State<OnBoardingSlide> {
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