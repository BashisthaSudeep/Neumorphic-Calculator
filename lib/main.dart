import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_calculator/bloc/calculator/calculator_bloc.dart';
import 'package:neo_calculator/screens/calculator_app.dart';
import 'themes/neu_theme_light.dart';

void main() {
  runApp(NeoCalc());
}

class NeoCalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            return CalculatorBloc();
          })
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: neuThemeLight(),
            home: CalculatorApp()));
  }
}
