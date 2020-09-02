import 'package:bloc/bloc.dart';
import 'package:neo_calculator/model/operator.dart';
import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  double numberA = 0, numberB = 0;
  String expression = "", result = "0";
  Operator operator;

  CalculatorBloc() : super(CalculatorLoaded());

  CalculatorState get initialState {
    return CalculatorLoaded();
  }

  @override
  Stream<CalculatorState> mapEventToState(CalculatorEvent event) async* {
    try {
      if (event is ResetCalculator) {
        numberA = 0;
        numberB = 0;
        expression = "";
        result = "0";

        yield CalculatorLoaded();
      } else if (event is NumberPressed) {
        final int number = event.number;
        if (expression.length < 8) {
          expression += number.toString();
        }

        result = "";

        yield CalculatorLoaded(
            result: result,
            expression: expression,
            numberA: numberA,
            numberB: numberB);
      } else if (event is CalculateResult) {
        if (operator != null) {
          numberB = double.parse(expression);
          expression = "";
          switch (operator) {
            case Operator.plus:
              result = (numberA + numberB).toString();
              break;

            case Operator.minus:
              result = (numberA - numberB).toString();
              break;

            case Operator.multiply:
              result = (numberA * numberB).toString();
              break;

            case Operator.divide:
              result = (numberA / numberB).toString();
              break;

            case Operator.percent:
              result = ((numberA / numberB) * 100).toString();
              break;
          }
        } else {
          if (result != "")
            result = result;
          else
            result = expression;
        }
        operator = null;

        if (result.length > 14) {
          yield CalculatorFailed("MEM ERROR");
        } else {
          yield CalculatorLoaded(
              result: result,
              expression: expression,
              numberA: numberA,
              numberB: numberB);
        }
      } else if (event is OperatorPressed) {
        operator = event.operator;

        if (result == "") {
          if (expression != "") numberA = double.parse(expression);
        } else {
          numberA = double.parse(result);
        }

        expression = "";
      } else if (event is BackspacePressed) {
        if (expression.length > 0)
          expression = expression.substring(0, expression.length - 1);

        yield CalculatorLoaded(
            result: result,
            expression: expression,
            numberA: numberA,
            numberB: numberB);
      } else if (event is DecimalPressed) {
        if (expression.length == 0)
          expression = "0.";
        else
          expression += ".";

        yield CalculatorLoaded(
            result: result,
            expression: expression,
            numberA: numberA,
            numberB: numberB);
      } else {
        yield CalculatorFailed("Event Unidentified");
      }
    } catch (_) {
      yield CalculatorFailed("Some error occured");
    }
  }
}
