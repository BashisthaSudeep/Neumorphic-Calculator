import 'package:flutter/material.dart';
import 'package:neo_calculator/components/calculator_body.dart';
import 'package:neo_calculator/components/calculator_screen.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CalculatorScreen(),
          CalculatorBody(),
        ],
      ),
    ));
  }
}
