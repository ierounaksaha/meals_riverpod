import 'package:flutter/material.dart';
import 'package:meals_riverpod/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key,});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {

  var _glutenFreeFilterSet = false;
  var _lactosFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
    _vegetarianFilterSet = activeFilters[Filter.vegetarian]!;
    _lactosFreeFilterSet = activeFilters[Filter.lactosFree]!;
    _veganFilterSet = activeFilters[Filter.vegan]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result){
          if(didPop) return;

          ref.read(filtersProvider.notifier).setFilters(
            {
              Filter.glutenFree : _glutenFreeFilterSet,
              Filter.lactosFree : _lactosFreeFilterSet,
              Filter.vegetarian : _vegetarianFilterSet,
              Filter.vegan : _veganFilterSet,
            }
          );
          // Navigator.of(context).pop();
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (newValue){
                setState(() {
                  _glutenFreeFilterSet = newValue;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text('Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(
              value: _lactosFreeFilterSet,
              onChanged: (newValue){
                setState(() {
                  _lactosFreeFilterSet = newValue;
                });
              },
              title: Text(
                'Lactos-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text('Only include lactos-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (newValue){
                setState(() {
                  _vegetarianFilterSet = newValue;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text('Only include vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (newValue){
                setState(() {
                  _veganFilterSet = newValue;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text('Only include vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
