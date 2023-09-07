import 'package:flutter/material.dart';

class FilteredScreen extends StatefulWidget {
  const FilteredScreen({super.key});

  @override
  State<FilteredScreen> createState() {
    return _FilteredScreenState();
  }
}

class _FilteredScreenState extends State<FilteredScreen> {
  var _glutenFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filtered"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenFree,
            onChanged: (isChecked) {
              setState(() {
                _glutenFree = isChecked;
              });
            },
            title: Text(
              "gluten free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "This show the gluteen free meal",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
