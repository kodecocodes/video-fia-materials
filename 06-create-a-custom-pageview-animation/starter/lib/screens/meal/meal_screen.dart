import 'package:flutter/material.dart';

import '../../models/extra.dart';
import '../../models/meal.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/recommended_meals.dart';
import '../../widgets/share_button.dart';
import 'extra_item.dart';

class MealScreen extends StatefulWidget {
  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  final List<Extra> _selectedExtras = [];
  bool _appBarFullyShown = false;
  bool get appBarFullyShown => _appBarFullyShown;

  bool _onNotificationHandler(ScrollNotification notification) {
    if (notification.depth == 0 && notification is ScrollUpdateNotification) {
      if (notification.metrics.pixels > 200) {
        _appBarFullyShown = true;
        setState(() {});
      } else {
        _appBarFullyShown = false;
        setState(() {});
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[100],
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(width: 16),
            Text(
              "\$${meal.price}",
              style: textTheme.headline4?.copyWith(
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: PrimaryButton(name: "Add to Cart", onTap: () {}),
            ),
          ],
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: _onNotificationHandler,
        child: CustomScrollView(
          slivers: [
            MealDetailAppBar(appBarFullyShown: appBarFullyShown, meal: meal),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  MealInfo(meal: meal),
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: Text(
                      "Extras",
                      style: textTheme.headline6,
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var i = 0; i < extras.length; i++)
                          ExtraItem(
                            extra: extras[i],
                          )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: _selectedExtras.isEmpty
                        ? const Text("You haven't selected any Extras")
                        : Wrap(
                            children: [
                              for (var i = 0; i < _selectedExtras.length; i++)
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  child: Chip(
                                    label: Text(_selectedExtras[i].name),
                                    padding: const EdgeInsets.all(8),
                                    backgroundColor: colorScheme.secondary,
                                    labelStyle:
                                        const TextStyle(color: Colors.white),
                                  ),
                                )
                            ],
                          ),
                  ),
                  ShareButton(),
                  const SizedBox(height: 32),
                  RecommendedMeals(),
                  const SizedBox(height: 200),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MealDetailAppBar extends StatelessWidget {
  const MealDetailAppBar({
    Key? key,
    required this.appBarFullyShown,
    required this.meal,
  }) : super(key: key);

  final bool appBarFullyShown;
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      iconTheme:
          IconThemeData(color: appBarFullyShown ? Colors.black : Colors.white),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          meal.name,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.white),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              meal.imgUrl,
              fit: BoxFit.cover,
            ),
            // Bottom gradient for icons
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, -0.4),
                  colors: <Color>[Color(0x60000000), Color(0x00000000)],
                ),
              ),
            ),
            // Bottom gradient for texts
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, 0.5),
                  end: Alignment(0.0, 0.0),
                  colors: <Color>[
                    Color(0x60000000),
                    Color(0x00000000),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.favorite_outline),
          tooltip: 'Add to Favourite',
          onPressed: () {},
        ),
      ],
    );
  }
}

class MealInfo extends StatelessWidget {
  const MealInfo({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: textTheme.headline6,
          ),
          const SizedBox(height: 16),
          Text(
            meal.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}
