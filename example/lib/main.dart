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
        backgroundColor: Colors.red,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                RoundClothButton(
                  expandFactor: 49,
                  backgroundColor: Colors.amber,
                  gradientColor: Colors.red,
                  height: 100,
                  width: 500,
                  child: Text(
                    "Round Cloth Button",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ClothButton(
                  expandFactor: 10,
                  backgroundColor: Colors.amber,
                  height: 100,
                  gradientColor: Colors.black87,
                  child: Text(
                    "Cloth Button",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  width: 500,
                ),
                LiquidButton(
                  expandFactor: 20,
                  backgroundColor: Colors.amber,
                  height: 100,
                  child: Text(
                    "Liquid Button",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  gradientColor: Colors.blueAccent,
                  width: 500,
                ),
              ],
            )),
      ),
    );
  }
}
