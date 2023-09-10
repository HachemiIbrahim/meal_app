import 'package:flutter/material.dart';
import 'package:meal_app/screen/category_screen.dart';
import 'package:meal_app/screen/meal_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/meal_provider.dart';
import 'package:meal_app/provider/favorites_provider.dart';

import '../model/meal.dart';
import 'filtered_screen.dart';

const kInsitialFilter = {
  filter.isGlutenFree: false,
  filter.isLactoseFree: false,
  filter.isVegeterian: false,
  filter.isVegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsState();
  }
}

class _TabsState extends ConsumerState<TabsScreen> {
  int _selectedIndex = 0;
  List<Meal> favoritesMeals = [];
  Map<filter, bool> _selectedFilters = kInsitialFilter;

  void _SelectedPage(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  void _SelectedScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filter') {
      final result = await Navigator.of(context).push<Map<filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilteredScreen(
            currentFilters: _selectedFilters,
          ),
        ),
      );
      setState(() {
        _selectedFilters = result ?? kInsitialFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealProvider);
    final availableMeals = meals.where((meal) {
      if (_selectedFilters[filter.isGlutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[filter.isLactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[filter.isVegeterian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[filter.isVegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    String text = "Category";
    Widget content = CategoryScreen(
      availebleMeals: availableMeals,
    );
    if (_selectedIndex == 1) {
      final favoritesMeals = ref.watch(favoriteMealProvider);
      text = "Favorites";
      content = MealScreen(
        meals: favoritesMeals,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      drawer: MainDrawer(
        onSelectedScreen: _SelectedScreen,
      ),
      body: content,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _SelectedPage,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "favorites")
          ]),
    );
  }
}
