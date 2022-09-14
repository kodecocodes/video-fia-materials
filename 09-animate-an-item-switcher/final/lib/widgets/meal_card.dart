import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  final bool isMiniCard;
  final double? height;

  const MealCard(
      {Key? key, required this.meal, this.isMiniCard = false, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        "/meal",
        arguments: meal,
      ),
      child: Container(
        height: height ?? 180,
        child: Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 12.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  // height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(meal.imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.name,
                        style: textTheme.headline6?.copyWith(
                          color: colorScheme.onPrimary,
                        ),
                      ),
                      !isMiniCard
                          ? Text(
                              meal.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            )
                          : const SizedBox(),
                      Text(
                        "\$${meal.price}",
                        style: textTheme.bodyText1?.copyWith(
                          color: colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
