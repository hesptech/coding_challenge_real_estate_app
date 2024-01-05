import 'package:flutter/material.dart';

import 'package:coding_challenge_real_estate_app/config/config.dart';
import 'package:coding_challenge_real_estate_app/models/models.dart';
import 'package:coding_challenge_real_estate_app/presentation/utils/data_formatter.dart';
import 'package:coding_challenge_real_estate_app/api/listings_api.dart';
import 'package:coding_challenge_real_estate_app/presentation/widgets/listing_card.dart';

class ListingsScreen extends StatelessWidget {

  static const String name = 'ListingsScreen_screen';

  const ListingsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      title: Image.asset('assets/images/coding_challenge_logo.png', fit: BoxFit.cover),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_outlined,
            size: 42.0,
            color: Colors.grey,  
          ),
        ),        
      ],
    ),
    body: Column(
      children: [
        SizedBox(
          height: 100.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SearchBar(
                  
                  hintText: "Search Here...",
                  backgroundColor: MaterialStateProperty.all<Color>(AppTheme.kOnPrimary),
                  hintStyle: const MaterialStatePropertyAll(TextStyle(color: AppTheme.kTxtLightGreyColor)),
                  //controller: controller,
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(horizontal: 15),
                  ),
                  trailing: const [
                    Icon(
                      Icons.search, 
                      size: 36.0,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder<List<Listing>>(
            future: ListingsApi.getListings(context),  
            builder: (context, snapshot) {
              final listings = snapshot.data;
        
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator(),);
                default:
                  if(snapshot.hasError) {
                    return const Center(child: Text('Some error occured!'),);
                  } else {
                    return buildListings(listings!);
                  }
              }
            }
          ),
        ),
      ],
    ),
  );

  Widget buildListings(List<Listing> listings) => ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemCount: listings.length,
    itemBuilder: (context, index) {
      final listing = listings[index];
      final numIndexToString = index.toString();

      return index == 0 ? 
      ListTile(
        title: Text(listing.listPrice?? ''),
        subtitle: Text(numIndexToString),
      ) : 
      ListingCard(listing: listing);
    }
  );
}