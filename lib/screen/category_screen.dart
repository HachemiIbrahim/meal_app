import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_grid_item.dart';
import 'package:meal_app/model/category.dart';
import 'package:meal_app/model/meal.dart';
import '../data/dummy_data.dart';
import 'meal_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.onToogledFavoriteMeal});

  final void Function(Meal meal) onToogledFavoriteMeal;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((element) => element.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealScreen(
        meals: filteredMeals,
        title: category.title,
        onToogledFavoriteMeal: onToogledFavoriteMeal,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            for (final category in availableCategories)
              CategotyGridItem(
                category: category,
                OnSelectedCategory: () {
                  _selectCategory(context, category);
                },
              )
          ]),
    );
  }
}
