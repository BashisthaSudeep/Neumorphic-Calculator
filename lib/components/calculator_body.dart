import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_calculator/bloc/calculator/calculator.dart';
import 'package:neo_calculator/components/neumorphic_button.dart';
import 'package:neo_calculator/model/operator.dart';

class CalculatorBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (BuildContext context, CalculatorState state) {
        return Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NeumorphicButton(
                    text: "AC",
                    textColor: Colors.black87,
                    onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                        .add(ResetCalculator()),
                  ),
                  NeumorphicButton(
                    text: "/",
                    textColor: Colors.black87,
                    onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                        .add(OperatorPressed(operator: Operator.divide)),
                  ),
                  NeumorphicButton(
                    text: "X",
                    textColor: Colors.black87,
                    onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                        .add(OperatorPressed(operator: Operator.multiply)),
                  ),
                  NeumorphicButton(
                    text: "BS",
                    textColor: Colors.black87,
                    onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                        .add(BackspacePressed()),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NeumorphicButton(
                    text: "7",
                    textColor: Colors.black87,
                    onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                        .add(NumberPressed(number: 7)),
                  ),
                  NeumorphicButton(
                    text: "8",
                    textColor: Colors.black87,
                    onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                        .add(NumberPressed(number: 8)),
                  ),
                  NeumorphicButton(
                    text: "9",
                    textColor: Colors.black87,
                    onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                        .add(NumberPressed(number: 9)),
                  ),
                  NeumorphicButton(
                    text: "-",
                    textColor: Colors.black87,
                    onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                        .add(OperatorPressed(operator: Operator.minus)),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NeumorphicButton(
                    text: "4",
                    textColor: Colors.black87,
                    onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                        .add(NumberPressed(number: 4)),
                  ),
                  NeumorphicButton(
                    text: "5",
                    textColor: Colors.black87,
                    onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                        .add(NumberPressed(number: 5)),
                  ),
                  NeumorphicButton(
                    text: "6",
                    textColor: Colors.black87,
                    onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                        .add(NumberPressed(number: 6)),
                  ),
                  NeumorphicButton(
                    text: "+",
                    textColor: Colors.black87,
                    onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                        .add(OperatorPressed(operator: Operator.plus)),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            NeumorphicButton(
                              text: "1",
                              textColor: Colors.black87,
                              onPressed: () =>
                                  BlocProvider.of<CalculatorBloc>(context)
                                      .add(NumberPressed(number: 1)),
                            ),
                            NeumorphicButton(
                              text: "2",
                              textColor: Colors.black87,
                              onPressed: () =>
                                  BlocProvider.of<CalculatorBloc>(context)
                                      .add(NumberPressed(number: 2)),
                            ),
                            NeumorphicButton(
                              text: "3",
                              textColor: Colors.black87,
                              onPressed: () =>
                                  BlocProvider.of<CalculatorBloc>(context)
                                      .add(NumberPressed(number: 3)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            NeumorphicButton(
                              text: "%",
                              textColor: Colors.black87,
                              onPressed: () =>
                                  BlocProvider.of<CalculatorBloc>(context).add(
                                      OperatorPressed(
                                          operator: Operator.percent)),
                            ),
                            NeumorphicButton(
                              text: "0",
                              textColor: Colors.black87,
                              onPressed: () =>
                                  BlocProvider.of<CalculatorBloc>(context)
                                      .add(NumberPressed(number: 0)),
                            ),
                            NeumorphicButton(
                              text: ".",
                              textColor: Colors.black87,
                              onPressed: () =>
                                  BlocProvider.of<CalculatorBloc>(context)
                                      .add(DecimalPressed()),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Column(
                    children: <Widget>[
                      NeumorphicButton(
                        text: "=",
                        textColor: Colors.black87,
                        onPressed: () =>
                            BlocProvider.of<CalculatorBloc>(context)
                                .add(CalculateResult()),
                        isPill: true,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
