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
  double _selectorPositionX = 24;
  final double _selectorWidth = 30;

  final _itemKey1 = GlobalKey();
  final _itemKey2 = GlobalKey();
  final _itemKey3 = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setWidgetPositionX(_itemKey1);
    });
  }

  _selectItem(int id) {
    _currentSelection = id;
    _setMeals();
    GlobalKey selectedGlobalKey;
    switch (id) {
      case 1:
        selectedGlobalKey = _itemKey1;
        break;
      case 2:
        selectedGlobalKey = _itemKey2;
        break;
      case 3:
        selectedGlobalKey = _itemKey3;
        break;
      default:
        return;
    }
    _setWidgetPositionX(selectedGlobalKey);
  }

  _setWidgetPositionX(GlobalKey key) {
    final RenderBox widgetRenderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final widgetPosition = widgetRenderBox.localToGlobal(Offset.zero);
    final widgetSize = widgetRenderBox.size;
    _selectorPositionX =
        widgetPosition.dx - ((_selectorWidth - widgetSize.width) / 2);
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
              AnimatedPositioned(
                duration: const Duration(milliseconds: 450),
                curve: Curves.fastOutSlowIn,
                left: _selectorPositionX,
                bottom: 4,
                child: Container(
                  height: 4,
                  width: _selectorWidth,
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
                      key: _itemKey1,
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
                      key: _itemKey2,
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
                      key: _itemKey3,
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
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 450),
            transitionBuilder: (Widget child, Animation<double> animation) {
              //return ScaleTransition(scale: animation, child: child);
              return RotationTransition(turns: animation, child: child);
            },
            child: MealsList(
              key: ValueKey(_currentSelection),
              meals: _meals,
            ),
          )
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
