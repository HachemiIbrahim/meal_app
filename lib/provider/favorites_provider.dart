import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/meal.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);

  void toogleFavoriteMeal(Meal meal) {
    final isFavorites = state.contains(meal);

    if (isFavorites) {
      state = state.where((m) => m.id != meal).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favoriteMealProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>((ref) {
  return FavoriteMealNotifier();
});
