import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../style/concave_decoration.dart';
import 'package:neo_calculator/bloc/calculator/calculator.dart';

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Decoration Style for calculator screen

    return Container(
      padding: EdgeInsets.all(15.0),
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height * 0.18,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.13,
          right: 10,
          left: 10,
          bottom: MediaQuery.of(context).size.height * 0.02),
      decoration: ConcaveDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          colors: [Color.fromRGBO(179, 179, 179, 1), Colors.white],
          depression: 5),
      child: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (BuildContext context, CalculatorState state) {
          if (state is CalculatorLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${state.expression}",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headline2.color,
                      fontSize: 30.0),
                ),
                Padding(padding: EdgeInsets.all(3)),
                Text(
                  "${state.result}",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w800),
                )
              ],
            );
          } else if (state is CalculatorFailed) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Error",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headline2.color,
                      fontSize: 30.0),
                ),
                Padding(padding: EdgeInsets.all(3)),
                Text(
                  "${state.error}",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w800),
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
