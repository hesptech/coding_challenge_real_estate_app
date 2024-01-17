
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, List<String>>((ref) {
  return FavoritesNotifier();
});


class FavoritesNotifier extends StateNotifier<List<String>> {
  FavoritesNotifier():super([]);

  void addFavorite(String favorite) {
    state = [
      ...state,
      favorite
    ];
  }

  void deleteFavorite(String favorite) {
    state.removeWhere((element) => element == favorite);
  }

  List<String> favoritesList() {
    return state;
  }

}