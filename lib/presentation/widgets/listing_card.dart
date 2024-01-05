import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:coding_challenge_real_estate_app/config/config.dart';
import 'package:coding_challenge_real_estate_app/models/models.dart';
import 'package:coding_challenge_real_estate_app/presentation/utils/data_formatter.dart';

class ListingCard extends StatelessWidget {

  final Listing listing;

  const ListingCard({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {

    final String images = listing.images?.first?? '';
    final dataFormatted = DataFormatter(listing);

    return  Card(
      margin: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Stack(
        children: [
          FadeInImage(
            height: 200,
            width: MediaQuery.of(context).size.width - 48,
            placeholder: const AssetImage('assets/images/no-image.jpg'), 
            image: NetworkImage('https://cdn.repliers.io/$images?class=medium'),
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/images/no-image.jpg');
            },
            fit: BoxFit.cover,
            fadeInDuration: const Duration( milliseconds: 300),
          ),
          Positioned(
            top: 125,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          Positioned(
            top: 140,
            left: 20,
            child: Text(
              dataFormatted.address, 
              style: const TextStyle(
                color: AppTheme.kOnPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 125,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.kOnPrimary,
                minimumSize: const Size(60.0, 28.0),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              ),
              onPressed: () {
                //Navigator.pushNamed(context, 'details', arguments: listing);
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.star, 
                    color: AppTheme.kSecondaryColor,
                    size: 18.0,
                  ),
                  SizedBox(width: 5.0,),
                  Text(
                    '3.6', 
                    style: TextStyle(
                      color: AppTheme.kOnBackgroundColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 170,
            left: 20,
            child: Text(
              dataFormatted.listPrice, 
              style: const TextStyle(
                color: AppTheme.kOnPrimary,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ], 
              ),
            ),
          ),
          Positioned(
            top: 170,
            right: 20,
            child: Text(
              dataFormatted.numBedrooms, 
              style: const TextStyle(
                color: AppTheme.kOnPrimary,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}