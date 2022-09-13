import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
  // double _size = 100;
  // Color _boxColor = Colors.green;
  // double _boxOpacity = 1.0;
  bool _showBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _showBox ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 1000),
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              width: _showBox ? 200 : 100,
              height: _showBox ? 200 : 100,
              color: _showBox ? Colors.orange : Colors.green),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // _size = _size == 100 ? 200 : 100;
            // _boxColor =
            //     _boxColor == Colors.green ? Colors.orange : Colors.green;
            _showBox = !_showBox;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
