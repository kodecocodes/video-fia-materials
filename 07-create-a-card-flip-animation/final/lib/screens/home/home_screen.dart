import 'package:flutter/material.dart';

import 'categories_list.dart';
import 'meals_switcher.dart';
import 'offers_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              "RW-Eats",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Food Delivery",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: Colors.grey),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search_rounded,
                size: 32,
                color: Colors.grey[800],
              ),
              onPressed: () {}),
        ],
      ),
      drawer: const AppDrawer(),
      body: ListView(
        children: [
          OffsersSlider(),
          const CategoriesList(),
          MealsSwitcher(),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Drawer(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 64,
                      ),
                      child: Text(
                        'RW-Eats',
                        style: TextStyle(
                          color: colorScheme.secondary,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const Divider(height: 1, thickness: 1),
                    const ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text('Profile'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.message),
                      title: const Text('Payment Methods'),
                      onTap: () {
                        Navigator.popAndPushNamed(
                          context,
                          '/payment_methods',
                        );
                      },
                    ),
                    const Spacer(),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Logout'),
                      onTap: () {
                        Navigator.popAndPushNamed(
                          context,
                          '/auth',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
