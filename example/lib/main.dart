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
                  backgroundColor: Colors.black87,
                  gradientColor: Colors.black54,
                  height: 100,
                  width: 400,
                  child: Text(
                    "Round Cloth Button",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ClothButton(
                  expandFactor: 10,
                  backgroundColor: Colors.black87,
                  height: 100,
                  gradientColor: Colors.black54,
                  child: Text(
                    "Cloth Button",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  width: 400,
                ),
                LiquidButton(
                  expandFactor: 20,
                  backgroundColor: Colors.black87,
                  height: 100,
                  child: Text(
                    "Liquid Button",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  gradientColor: Colors.black54,
                  width: 400,
                ),
              ],
            )),
      ),
    );
  }
}
