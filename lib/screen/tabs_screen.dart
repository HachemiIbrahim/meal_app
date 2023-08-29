import 'package:flutter/material.dart';
import 'package:meal_app/screen/category_screen.dart';
import 'package:meal_app/screen/meal_screen.dart';

import '../model/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return TabsState();
  }
}

class TabsState extends State<TabsScreen> {
  int _selectedIndex = 0;
  List<Meal> favoritesMeals = [];

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toogleFavoriteMeal(Meal meal) {
    final isExesting = favoritesMeals.contains(meal);

    if (isExesting) {
      setState(() {
        favoritesMeals.remove(meal);
      });
      _showMessage("Removed from favorites");
    } else {
      setState(() {
        favoritesMeals.add(meal);
      });
      _showMessage("Marked as favorites");
    }
  }

  void _SelectedPage(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = CategoryScreen(
      onToogledFavoriteMeal: _toogleFavoriteMeal,
    );
    if (_selectedIndex == 1) {
      content = MealScreen(
        meals: favoritesMeals,
        title: "Favourites",
        onToogledFavoriteMeal: _toogleFavoriteMeal,
      );
    }

    return Scaffold(
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
