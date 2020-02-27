import 'package:flutter/material.dart';
import 'package:liquid_button/liquid_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: ClothButton(
              expandFactor: 20,
              backgroundColor: Colors.amber,
              height: 100,
              width: 400,
        )),
      ),
    );
  }
}
