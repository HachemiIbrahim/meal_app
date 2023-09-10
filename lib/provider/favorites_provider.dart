import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/meal.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);

  String toogleFavoriteMeal(Meal meal) {
    final isFavorites = state.contains(meal);

    if (isFavorites) {
      state = state.where((m) => m.id != meal).toList();
      return "not favorite any more";
    } else {
      state = [...state, meal];
      return "add as favorite";
    }
  }
}

final favoriteMealProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>((ref) {
  return FavoriteMealNotifier();
});
