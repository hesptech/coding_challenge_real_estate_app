import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:coding_challenge_real_estate_app/presentation/providers/exit_button_provider.dart';
import 'package:coding_challenge_real_estate_app/config/config.dart';

class OnBoardingButton extends ConsumerWidget {

  final String textButton; 
  final PageController? controller;
  final bool endReached;

  const OnBoardingButton({super.key, required this.textButton, this.controller, required this.endReached});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    late double pageNum = controller?.page?? 0;
    final bool exitBool = (textButton == 'Exit') ? true : false ;

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
        if (!exitBool && pageNum <= 1) {
          controller!.nextPage(
            duration: const Duration(seconds: 1), 
            curve: Curves.easeOut
          );
        } else {
          Navigator.pushNamed(context, 'listings');
        }

        if(pageNum > 1.5) ref.read(exitButtonProvider.notifier).update((state) => state = true);
        //print(ref.read(exitButtonProvider.notifier).state);
        //print(controller?.offset?? 0);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 5.0,),
          Text(
            '$textButton  ',
            style: const TextStyle(fontSize: 18)
          ),
          !exitBool ? const Stack(
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