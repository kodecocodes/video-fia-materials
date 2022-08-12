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
  bool _showBox = false;
  // double _bottomOffset = 500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedContainer(
          // Update Note:  As per the latest flutter linting(at the time of
          // recording). It is suggested that to use const keyword with constant
          // constructors to improve the app performance
          duration: const Duration(milliseconds: 1000),
          curve: Curves.bounceOut,
          width: _showBox ? 200 : 100,
          height: _showBox ? 200 : 100,
          color: _showBox ? Colors.orange : Colors.green,
        ),
      ),
      // body: Stack(
      //   alignment: Alignment.bottomCenter,
      //   children: [
      //     AnimatedPositioned(
      //       bottom: _bottomOffset,
      //       duration: Duration(milliseconds: 2000),
      //       // curve: Curves.bounceOut,
      //       // curve: Curves.easeIn,
      //       curve: Curves.easeInOutQuint,
      //       child: Container(
      //         width: 100,
      //         height: 100,
      //         decoration: BoxDecoration(
      //           color: Colors.green,
      //           shape: BoxShape.circle,
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showBox = !_showBox;
            // _bottomOffset = 0;
          });
        },
        tooltip: 'Animate',
        // Update Note:  As per the latest flutter linting(at the time of
        // recording). It is suggested that to use const keyword with constant
        // constructors to improve the app performance
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
