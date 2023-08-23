import 'package:flutter/material.dart';
import 'package:meal_app/model/category.dart';

class CategotyGridItem extends StatelessWidget {
  const CategotyGridItem(
      {super.key, required this.category, required this.OnSelectedCategory});

  final Category category;
  final void Function() OnSelectedCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: OnSelectedCategory,
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.55),
            category.color.withOpacity(0.9)
          ], begin: Alignment.topLeft),
        ),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.background),
          ),
        ),
      ),
    );
  }
}
