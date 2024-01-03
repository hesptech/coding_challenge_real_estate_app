import 'package:flutter/material.dart';
import 'package:coding_challenge_real_estate_app/config/config.dart';

class RichtextSlides extends StatelessWidget {
  
  final String titlePrimaryColor;
  final String titleSecondaryColor;
  final String titleDefaultColor;
  final String paragraph;
  
  const RichtextSlides({
    super.key, 
    required this.titlePrimaryColor, 
    required this.titleSecondaryColor, 
    required this.titleDefaultColor,
    required this.paragraph,
  });

  @override
  Widget build(BuildContext context) {

    const double fonSizeTitle = 32.0;

    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
            text: titlePrimaryColor,
            style: const TextStyle( 
              color: AppTheme.kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: fonSizeTitle,      
           ),
          ),
          TextSpan(
            text: titleSecondaryColor,
            style: const TextStyle( 
              color: AppTheme.kSecondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: fonSizeTitle, 
            )
          ),
          TextSpan(
            text: titleDefaultColor,
            style: const TextStyle( 
              fontWeight: FontWeight.bold,
              fontSize: fonSizeTitle, 
            )
          ),
          const TextSpan(
            text: ' ',
            style: TextStyle( 
              height: 4.0 
            )
          ),
          TextSpan(
            text: paragraph,
            style: const TextStyle( 
              color: AppTheme.kTxtLightGreyColor, 
              fontSize: 18.0,
            )
          )
        ]
      ),
    );
  }
}