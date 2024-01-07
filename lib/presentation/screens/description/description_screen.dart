import 'package:flutter/material.dart';
import 'package:coding_challenge_real_estate_app/models/models.dart';
import 'package:coding_challenge_real_estate_app/config/config.dart';
import 'package:coding_challenge_real_estate_app/presentation/utils/data_formatter.dart';

class DescriptionScreen extends StatelessWidget {

  static const String name = 'description_screen';

  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Listing listing = ModalRoute.of(context)?.settings.arguments! as Listing;
    List<int> stars = [1, 2, 3, 4];
    final dataFormatted = DataFormatter(listing);
    final String description = listing.details?.description?? '';


    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child:  SingleChildScrollView(
          child: Column(
            children: [
              ImgStack( listing: listing ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                            /* Icon(
                              Icons.star, 
                              color: AppTheme.kSecondaryColor,
                              size: 18.0,
                            ), */  
                        ...stars.map((e) => const Icon(Icons.star, color: AppTheme.kSecondaryColor, size: 26.0,)),
                        Icon(
                          Icons.star, 
                          color: AppTheme.kSecondaryColor.withOpacity(0.5),
                          size: 26.0,
                        ), 
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dataFormatted.address, 
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                          ),
                        ),
                        const Icon(
                          Icons.favorite_outline, 
                          size: 38.0,
                        ),
                      ],
                    ),
                    const SizedBox(height: 18.0),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),   
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 18, 
                          color: AppTheme.kTxtLightGreyColor, 
                          height: 1.8, 
                        ), 
                        children: <TextSpan>[
                          TextSpan(text: description.substring(0, 120)),
                          const TextSpan(
                            text: ' Read More', 
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.kPrimaryColor,
                            ),
                            /* recognizer: TapGestureRecognizer()
                              ..onTap = () {
                              Navigator.pushNamed(context, 'game_screen');
                            }, */
                          ),
                        ]
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Card(
                      //margin: EdgeInsets.symmetric(horizontal: 20),
                      child: FadeInImage(
                        placeholder: AssetImage('assets/images/no-image.jpg'),
                        image: AssetImage('assets/images/house_map.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),   
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        dataFormatted.listPrice,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0,
                        ),   
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

class ImgStack extends StatelessWidget {
  
  final Listing listing;

  const ImgStack({ Key? key, required this.listing }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String images = listing.images?.first?? '';

    return Stack(
      children: [
        FadeInImage(
          width: double.infinity,
          height: 450,
          fit: BoxFit.cover,
          placeholder: const AssetImage('assets/images/no-image.jpg'), 
          //image: const AssetImage('assets/images/IMG-X7377266_1.webp'),
          //image: NetworkImage('https://cdn.repliers.io/$images?class=medium'),
          image: NetworkImage('https://applicazioni-web.net/images_repliers/$images'),
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset('assets/images/no-image.jpg');
          },
        ),
        const Positioned(
          top: 50.0,
          left: 25.0, // or whatever
          child: MyFAB(),
        ),
      ],
    );
  }
}

class MyFAB extends StatelessWidget {
  const MyFAB({super.key});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => { 
        Navigator.pop(context)
      },
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.kOnPrimary,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: const Icon(
          Icons.chevron_left_outlined,
          color: AppTheme.kOnBackgroundColor,
          size: 25.0,
        ),
      ),
    );
  }
}