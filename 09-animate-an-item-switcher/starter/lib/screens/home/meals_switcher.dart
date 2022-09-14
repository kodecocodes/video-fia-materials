import 'package:flutter/material.dart';
import '../../models/meal.dart';
import '../../widgets/meal_card.dart';

class MealsSwitcher extends StatefulWidget {
  @override
  State<MealsSwitcher> createState() => _MealsSwitcherState();
}

class _MealsSwitcherState extends State<MealsSwitcher> {
  List<Meal> _meals = topMeals;
  int _currentSelection = 1;

  _selectItem(int id) {
    _currentSelection = id;
    _setMeals();
    setState(() {});
  }

  _setMeals() {
    if (_currentSelection == 1) {
      _meals = topMeals;
    } else if (_currentSelection == 2) {
      _meals = continentalMeals;
    } else if (_currentSelection == 3) {
      _meals = favouriteMeals;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Positioned(
                left: 24,
                bottom: 4,
                child: Container(
                  height: 4,
                  width: 30,
                  decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    color: colorScheme.secondary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _selectItem(1);
                      },
                      child: Text(
                        "Top Meals",
                        style: textTheme.headline6?.copyWith(
                          color: _currentSelection == 1
                              ? colorScheme.secondary
                              : Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        _selectItem(2);
                      },
                      child: Text(
                        "Continental",
                        style: textTheme.headline6?.copyWith(
                          color: _currentSelection == 2
                              ? colorScheme.secondary
                              : Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        _selectItem(3);
                      },
                      child: Text(
                        "Your Favourite",
                        style: textTheme.headline6?.copyWith(
                          color: _currentSelection == 3
                              ? colorScheme.secondary
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          MealsList(meals: _meals)
        ],
      ),
    );
  }
}

class MealsList extends StatelessWidget {
  final List<Meal> meals;

  const MealsList({Key? key, required this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < meals.length; i++) MealCard(meal: meals[i])
      ],
    );
  }
}
