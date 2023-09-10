import 'package:flutter_riverpod/flutter_riverpod.dart';

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
