class CalculatorModel {
  String display = '';
  double? firstNumber;
  String? operator;

  void clear() {
    display = '';
    firstNumber = null;
    operator = null;
  }

  void delete() {
    if (display.isNotEmpty) {
      display = display.substring(0, display.length - 1);
    }
  }

  void addNumber(String value) {
    display += value;
  }

  void setOperator(String op) {
    if (display.isEmpty) return;

    firstNumber = double.tryParse(display);
    operator = op;
    display = '';
  }

  void calculate() {
    if (firstNumber == null || operator == null || display.isEmpty) return;

    double secondNumber = double.tryParse(display) ?? 0;
    double result = 0;

    if (operator == '+') {
      result = firstNumber! + secondNumber;
    } else if (operator == '-') {
      result = firstNumber! - secondNumber;
    } else if (operator == '*') {
      result = firstNumber! * secondNumber;
    } else if (operator == '/') {
      if (secondNumber == 0) {
        display = 'Error';
        return;
      }
      result = firstNumber! / secondNumber;
    } else if (operator == '%') {
      result = (firstNumber! * secondNumber) / 100;
    }
    display = result.toString();

    if (display.endsWith('.0')) {
      display = display.replaceAll('.0', '');
    }

    firstNumber = null;
    operator = null;
  }
}
