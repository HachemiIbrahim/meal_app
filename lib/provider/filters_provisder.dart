import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/meal_provider.dart';

enum filter { isGlutenFree, isLactoseFree, isVegeterian, isVegan }

class FiltersNotifier extends StateNotifier<Map<filter, bool>> {
  FiltersNotifier()
      : super({
          filter.isGlutenFree: false,
          filter.isLactoseFree: false,
          filter.isVegeterian: false,
          filter.isVegan: false,
        });

  void setFilters(Map<filter, bool> map) {
    state = map;
  }

  void setFilter(filter F, bool isActivated) {
    state = {...state, F: isActivated};
  }
}

final filterProvider =
    StateNotifierProvider<FiltersNotifier, Map<filter, bool>>(
        (ref) => FiltersNotifier());

final filterMealProvider = Provider((ref) {
  final meals = ref.watch(mealProvider);
  final selectedFilters = ref.watch(filterProvider);
  return meals.where((meal) {
    if (selectedFilters[filter.isGlutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (selectedFilters[filter.isLactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (selectedFilters[filter.isVegeterian]! && !meal.isVegetarian) {
      return false;
    }
    if (selectedFilters[filter.isVegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
