import 'package:flutter/material.dart';

class FilteredScreen extends StatefulWidget {
  const FilteredScreen({super.key, required this.currentFilters});

  final Map<filter, bool> currentFilters;

  @override
  State<FilteredScreen> createState() {
    return _FilteredScreenState();
  }
}

enum filter { isGlutenFree, isLactoseFree, isVegeterian, isVegan }

class _FilteredScreenState extends State<FilteredScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegeterian = false;
  var _vegan = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters[filter.isGlutenFree]!;
    _lactoseFree = widget.currentFilters[filter.isLactoseFree]!;
    _vegeterian = widget.currentFilters[filter.isVegeterian]!;
    _vegan = widget.currentFilters[filter.isVegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filtered"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            filter.isGlutenFree: _glutenFree,
            filter.isLactoseFree: _lactoseFree,
            filter.isVegeterian: _vegeterian,
            filter.isVegan: _vegan,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFree,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFree = isChecked;
                });
              },
              title: Text(
                "gluten-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "This show the gluteen-free meal",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFree,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFree = isChecked;
                });
              },
              title: Text(
                "lactose-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "This show the lactose-free meal",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegeterian,
              onChanged: (isChecked) {
                setState(() {
                  _vegeterian = isChecked;
                });
              },
              title: Text(
                "vegeterian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "This show the vegeterian meal",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegan,
              onChanged: (isChecked) {
                setState(() {
                  _vegan = isChecked;
                });
              },
              title: Text(
                "vegan",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "This show the vegan meal",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
