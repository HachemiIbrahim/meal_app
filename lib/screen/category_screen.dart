import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_grid_item.dart';
import 'package:meal_app/model/category.dart';
import 'package:meal_app/model/meal.dart';
import '../data/dummy_data.dart';
import 'meal_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.availebleMeals});
  final List<Meal> availebleMeals;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availebleMeals
        .where((element) => element.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealScreen(
        meals: filteredMeals,
        title: category.title,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: Container(
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
      ),
      builder: (context, child) => Padding(
        padding: EdgeInsets.only(top: 600 - animationController.value * 600),
        child: child,
      ),
    );
  }
}
