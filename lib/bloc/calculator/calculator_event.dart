import 'package:flutter/cupertino.dart';
import 'package:neo_calculator/model/operator.dart';

abstract class CalculatorEvent {}

class ResetCalculator extends CalculatorEvent {}

class NumberPressed extends CalculatorEvent {
  final int number;

  NumberPressed({@required this.number});
}

class OperatorPressed extends CalculatorEvent {
  final Operator operator;

  OperatorPressed({@required this.operator});
}

class BackspacePressed extends CalculatorEvent {}

class DecimalPressed extends CalculatorEvent {}

class CalculateResult extends CalculatorEvent {}
