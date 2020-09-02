abstract class CalculatorState {}

class CalculatorLoaded extends CalculatorState {
  final double numberA, numberB;
  final String expression, result;

  CalculatorLoaded(
      {this.numberA = 0,
      this.numberB = 0,
      this.expression = "",
      this.result = "0"});
}

class CalculatorSuccess extends CalculatorState {
  final double result;

  CalculatorSuccess(this.result);
}

class CalculatorFailed extends CalculatorState {
  final String error;

  CalculatorFailed(this.error);
}
