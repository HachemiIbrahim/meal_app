import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

import 'meal_detail.dart';

class MealScreen extends StatelessWidget {
  const MealScreen(
      {super.key,
      required this.meals,
      this.title,
      required this.onToogledFavoriteMeal});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToogledFavoriteMeal;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetail(
          onToogledFavoriteMeal: onToogledFavoriteMeal,
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(
          meal: meals[index],
          OnSelectedMeal: () {
            _selectMeal(context, meals[index]);
          }),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("This section is empty ...",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            const SizedBox(
              height: 16,
            ),
            Text(
              "it will beupdated later",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content,
      );
    }
  }
}
