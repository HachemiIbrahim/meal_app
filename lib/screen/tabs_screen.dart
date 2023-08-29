import 'package:flutter/material.dart';
import 'package:meal_app/screen/category_screen.dart';
import 'package:meal_app/screen/meal_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return TabsState();
  }
}

class TabsState extends State<TabsScreen> {
  int _selectedIndex = 0;
  void _SelectedPage(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const CategoryScreen();
    if (_selectedIndex == 1) {
      content = const MealScreen(meals: [], title: "Favourites");
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
