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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                RoundClothButton(
                  expandFactor: 20,
                  backgroundColor: Colors.amber,
                  height: 100,
                  width: 500,
                ),
                ClothButton(
              expandFactor: 20,
              backgroundColor: Colors.amber,
              height: 100,
                  width: 500,
                ),
                LiquidButton(
                  expandFactor: 20,
                  backgroundColor: Colors.amber,
                  height: 100,
                  width: 500,
                ),
              ],
        )),
      ),
    );
  }
}
