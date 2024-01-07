import 'package:flutter/material.dart';
import 'package:coding_challenge_real_estate_app/config/config.dart';

class OnBoardingButton extends StatelessWidget {

  final String textButton; 
  final PageController? controller;
  final bool endReached;

  const OnBoardingButton({super.key, required this.textButton, this.controller, required this.endReached});

  @override
  Widget build(BuildContext context) {

    late double pageNum = controller?.page?? 0;

    final String spacesTextButton = endReached ? '$textButton  ' : 'Next  ';

    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(5.0)),
        foregroundColor: MaterialStateProperty.all<Color>(AppTheme.kOnPrimary),
        backgroundColor: MaterialStateProperty.all<Color>(AppTheme.kPrimaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )
        )
      ),
      onPressed: () {
        if (!endReached && pageNum <= 1) {
          controller!.nextPage(
            duration: const Duration(seconds: 1), 
            curve: Curves.easeOut
          );
        } else {
          Navigator.pushNamed(context, 'listings');
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 5.0,),
          Text(
            spacesTextButton,
            style: const TextStyle(fontSize: 18)
          ),
          !endReached ? const Stack(
            children: [
              Icon(
                Icons.horizontal_rule_outlined,
              ),
              Positioned(
                left: 6.0,
                child: Icon(
                  Icons.horizontal_rule_outlined,
                )
              ),
              Positioned(
                left: 18.0,
                child: Icon(
                  Icons.east_outlined,
                )
              ),
              Text(
                "         ",
                style: TextStyle(fontSize: 18)
              ),
            ],
          ) : const SizedBox(),
          const SizedBox(width: 5.0,),
        ],
      )
    );
  }
}