import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/auth/auth_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/meal/meal_screen.dart';
import 'screens/payments/add_card_screen.dart';
import 'screens/payments/payment_methods_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

const Color _lightPrimaryColor = Colors.white;
const Color _lightSecondaryColor = Color(0xFF158443);
const Color _lightOnPrimaryColor = Color(0xFF274c71);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final base = ThemeData.light();

    return MaterialApp(
      title: 'Flutter Implicit Animations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: const ColorScheme.light(
          primary: _lightPrimaryColor,
          secondary: _lightSecondaryColor,
          onPrimary: _lightOnPrimaryColor,
          onSecondary: _lightPrimaryColor,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          iconTheme: const IconThemeData(color: Colors.black),
          toolbarTextStyle: TextTheme(
            headline6: TextStyle(color: Colors.grey[700], fontSize: 18),
          ).bodyText2,
          titleTextStyle: TextTheme(
            headline6: TextStyle(color: Colors.grey[700], fontSize: 18),
          ).headline6,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.all(20),
          border: InputBorder.none,
        ),
        textTheme: base.textTheme.copyWith(
          headline5: base.textTheme.headline5?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: _lightSecondaryColor,
          ),
          headline6: base.textTheme.headline5?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: _lightSecondaryColor,
          ),
          subtitle1: base.textTheme.subtitle1?.copyWith(
            fontWeight: FontWeight.w600,
            color: _lightSecondaryColor,
          ),
        ),
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        '/auth': (context) => const AuthScreen(),
        '/payment_methods': (context) => const PaymentMethodsScreen(),
        '/add_card': (context) => const AddCardScreen(),
        '/meal': (context) => const MealScreen(),
      },
    );
  }
}
