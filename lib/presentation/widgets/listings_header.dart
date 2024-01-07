import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:coding_challenge_real_estate_app/config/config.dart';
import 'package:coding_challenge_real_estate_app/models/models.dart';


class ListingsHeader extends StatelessWidget {
  
  final Listing listing;

  const ListingsHeader({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {

  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('d MMMM yyyy');
  final String formattedDateTime = formatter.format(now);

    return Container(
      margin: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 14.0),
      height: 130,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          //image: const AssetImage('assets/images/IMG-X7377266_1.webp'),
          //image: NetworkImage('https://cdn.repliers.io/IMG-X7377266_1.jpg?class=medium'),
          image: NetworkImage('https://applicazioni-web.net/images_repliers/IMG-X7377266_1.webp'),
          fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          const Positioned(
            top: 20,
            left: 20,
            child: Text(
              'Lets buy a house \nhere', 
              style: TextStyle(
                color: AppTheme.kOnPrimary, 
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.5, 1.5),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 80,
            left: 20,
            child: Text(
              'Discount 10%', 
              style: TextStyle(
                color: AppTheme.kOnPrimary, 
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0.5, 0.5),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ], 
              ),
            ),
          ),
          Positioned(
            top: 80,
            right: 20,
            child: Text(
              formattedDateTime, 
              style: const TextStyle(
                color: AppTheme.kOnPrimary,  
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0.5, 0.5),
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