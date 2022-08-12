// Copyright (c) 2022 Razeware LLC

// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use,
// copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom
// the Software is furnished to do so, subject to the following
// conditions:

// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// Notwithstanding the foregoing, you may not use, copy, modify,
// merge, publish, distribute, sublicense, create a derivative work,
// and/or sell copies of the Software in any work that is designed,
// intended, or marketed for pedagogical or instructional purposes
// related to programming, coding, application development, or
// information technology. Permission for such use, copying,
// modification, merger, publication, distribution, sublicensing,
// creation of derivative works, or sale is expressly withheld.

// This project and source code may use libraries or frameworks
// that are released under various Open-Source licenses. Use of
// those libraries and frameworks are governed by their own
// individual licenses.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.

import 'package:flutter/material.dart';
import '../../models/meal.dart';
import '../../widgets/meal_card.dart';

class MealsSwitcher extends StatefulWidget {
  const MealsSwitcher({Key? key}) : super(key: key);

  @override
  State<MealsSwitcher> createState() => _MealsSwitcherState();
}

class _MealsSwitcherState extends State<MealsSwitcher> {
  List<Meal> _meals = topMeals;
  int _currentSelection = 1;

  // Update Note: It is good practise to always mention the return type of a
  // method. For more info read [always_declare_return_types](https://dart-lang.github.io/linter/lints/always_declare_return_types.html)
  void _selectItem(int id) {
    _currentSelection = id;
    _setMeals();
    setState(() {});
  }

  void _setMeals() {
    // Updated Note: Added curly braces to the if-else statement since this
    // is recommeded as a good practise to avoid dangling problems, [curly_braces_in_flow_control_structures](https://dart-lang.github.io/linter/lints/curly_braces_in_flow_control_structures.html)
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
    // Update Note: Removed the type annotation as it is the recommeded way
    // (read for mor info: [omit_local_variable_types](https://dart-lang.github.io/linter/lints/omit_local_variable_types.html))
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
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
              Container(
                margin: const EdgeInsets.only(left: 16, bottom: 12.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _selectItem(1);
                      },
                      // Update Note: Used of single quotes 
                      // than double quotes. Ref: [prefer_single_quotes](https://dart-lang.github.io/linter/lints/prefer_single_quotes.html)
                      child: Text(
                        'Top Meals',
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
                        'Continental',
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
                        'Your Favourite',
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
            // Update Note: Used const keyword with
            // constant constructors as per [flutter lint rule](https://dart-lang.github.io/linter/lints/prefer_const_constructors.html)
            duration: const Duration(milliseconds: 450),
            // transitionBuilder: (Widget child, Animation<double> animation) {
            //   // return ScaleTransition(child: child, scale: animation);
            //   return RotationTransition(child: child, turns: animation);
            // },
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          for (var i = 0; i < meals.length; i++) MealCard(meal: meals[i])
        ],
      ),
    );
  }
}