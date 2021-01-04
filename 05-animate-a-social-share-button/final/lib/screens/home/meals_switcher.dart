import 'package:flutter/material.dart';
import '../../models/meal.dart';
import '../../widgets/meal_card.dart';

class MealsSwitcher extends StatefulWidget {
  @override
  _MealsSwitcherState createState() => _MealsSwitcherState();
}

class _MealsSwitcherState extends State<MealsSwitcher> {
  int _currentSelection = 1;
  double _selectorWidth = 30;

  _selectItem(int id) {
    _currentSelection = id;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;
    return Container(
      margin: EdgeInsets.all(16),
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
                  width: _selectorWidth,
                  decoration: ShapeDecoration(
                    shape: StadiumBorder(),
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
                        style: textTheme.headline6.copyWith(
                          color: _currentSelection == 1
                              ? colorScheme.secondary
                              : Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        _selectItem(2);
                      },
                      child: Text(
                        "Continental",
                        style: textTheme.headline6.copyWith(
                          color: _currentSelection == 2
                              ? colorScheme.secondary
                              : Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        _selectItem(3);
                      },
                      child: Text(
                        "Your Favourite",
                        style: textTheme.headline6.copyWith(
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
          if (_currentSelection == 1)
            MealsList(meals: topMeals)
          else if (_currentSelection == 2)
            MealsList(meals: continentalMeals)
          else if (_currentSelection == 3)
            MealsList(meals: favouriteMeals)
        ],
      ),
    );
  }
}

class MealsList extends StatelessWidget {
  final List<Meal> meals;

  const MealsList({Key key, this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < meals.length; i++) MealCard(meal: meals[i])
      ],
    );
  }
}
