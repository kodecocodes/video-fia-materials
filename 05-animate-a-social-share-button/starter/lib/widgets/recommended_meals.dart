import 'package:flutter/material.dart';

import '../models/meal.dart';
import 'meal_card.dart';

class RecommendedMeals extends StatelessWidget {
  const RecommendedMeals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return SizedBox(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: Text(
              'Meals You Might Like',
              style: textTheme.headline6,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              itemExtent: 300,
              children: [
                for (var i = 0; i < favouriteMeals.length; i++)
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: MealCard(
                      meal: favouriteMeals[i],
                      isMiniCard: true,
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
