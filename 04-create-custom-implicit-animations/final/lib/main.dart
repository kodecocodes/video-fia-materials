import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  static final Tween _fabTween = Tween(begin: 0.0, end: 1.0);
  double _progress = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
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
                const SizedBox(height: 16),
                Text("${(value * 100).round()}%"),
              ],
            );
          },
        ),
      ),
      floatingActionButton: TweenAnimationBuilder(
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
          child: const Icon(Icons.play_arrow),
        ),
        builder: (_, value, child) {
          // return Transform.rotate(
          // angle: (math.pi * 2) * value,
          return Transform.scale(
            scale: value as double,
            child: child,
          );
        },
      ),
    );
  }
}
