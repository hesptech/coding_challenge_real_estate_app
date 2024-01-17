import 'package:coding_challenge_real_estate_app/presentation/providers/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Favorites extends ConsumerWidget {

  static const String name = 'favorites_screen';

  const Favorites({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final favoriteList = ref.watch(favoritesProvider.notifier).favoritesList();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.vertical,
              itemCount: favoriteList.length,
              itemBuilder: ( _ , int index) => Text(favoriteList[index]),
            ),
          ],
        ),
      ),
    );
  }
}


class FavoritesCard extends StatelessWidget {
  const FavoritesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}