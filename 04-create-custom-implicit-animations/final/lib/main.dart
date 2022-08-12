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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter: Implicit Animations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Update Note: Explicitly mentioned the type of value the Tween variable
  // will return. This avoids errors of passing the incompatatible Tween to
  // TweenAnimtionBuilder
  static final Tween<double> _fabTween = Tween(begin: 0.0, end: 1.0);
  double _progress = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
      Center(
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 1000),
          tween: Tween<double>(begin: 0.0, end: _progress),
          builder: (_, double value, __) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: value,
                ),
                // Update Note: Used const keyword with
                // constant constructors as per [flutter lint rule](https://dart-lang.github.io/linter/lints/prefer_const_constructors.html)
                const SizedBox(height: 16),
                // Update Note: Used of single quotes 
                // than double quotes. Ref: [prefer_single_quotes](https://dart-lang.github.io/linter/lints/prefer_single_quotes.html)
                Text('${(value * 100).round()}%'),
              ],
            );
          },
        ),
      ),
      floatingActionButton: TweenAnimationBuilder<double>(
        // Update Note: Used const keyword with
        // constant constructors as per [flutter lint rule](https://dart-lang.github.io/linter/lints/prefer_const_constructors.html)
        duration: const Duration(milliseconds: 1000),
        curve: Curves.bounceOut,
        tween: _fabTween,
        child: FloatingActionButton(
          onPressed: _progress > 0.9
              ? null
              : () {
                  setState(() {
                    _progress += 0.1;
                  });
                },
          tooltip: 'Animate',
        // Update Note: Used const keyword with
        // constant constructors as per [flutter lint rule](https://dart-lang.github.io/linter/lints/prefer_const_constructors.html)
          child: const Icon(Icons.play_arrow),
        ),
        builder: (_, value, child) {
          // return Transform.rotate(
          // angle: (math.pi * 2) * value,
          return Transform.scale(
            scale: value,
            child: child,
          );
        },
      ),
    );
  }
}
