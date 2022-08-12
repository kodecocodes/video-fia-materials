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

import '../../models/extra.dart';
import '../../models/meal.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/recommended_meals.dart';
import '../../widgets/share_button.dart';
import 'extra_item.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({Key? key}) : super(key: key);

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  // Update Note: Made the private field final as recommeded in the flutter
  // lint rule, [prefer_final_fields](https://dart-lang.github.io/linter/lints/prefer_final_fields.html)
  final List<Extra> _selectedExtras = [];
  bool _appBarFullyShown = false;
  bool get appBarFullyShown => _appBarFullyShown;
  final Meal _defalutMeal = topMeals[0];

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
    // Update Note: 1. Unless specified the type Meal dart consider it's return
    // type as Object? which is a generic type. Here, we need to explicitly cast
    // its type at the end. 
    // 2. Also, it recommended in the flutter lint rule to
    // avoid type ommitation for local variables.
    // Ref: [omit_local_variable_types](https://dart-lang.github.io/linter/lints/omit_local_variable_types.html)
    // 3. After flutter 2 released the null safety version. It
    // is essential for developers to handle the nullable variables.
    //For more info read article on [?? operator](https://dart.dev/codelabs/null-safety#exercise-null-coalescing-operators)
    final meal =
        ModalRoute.of(context)?.settings.arguments as Meal? ?? _defalutMeal;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[100],
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(width: 16),
            Text(
              '\$${meal.price}',
              style: textTheme.headline4?.copyWith(
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: PrimaryButton(name: 'Add to Cart', onTap: () {}),
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
                      'Extras',
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
                  const ShareButton(),
                  const SizedBox(height: 32),
                  const RecommendedMeals(),
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
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
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
