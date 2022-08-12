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
