class ArithmeticCalculator extends ArithmeticCalculatorI {
  const ArithmeticCalculator();

  double? calculate(String text) {
    if (RegExp(r'[A-Za-z]').hasMatch(text)) return null;

    return double.tryParse(f('+', f('-', f('*', f('/', text)))));
  }
}

abstract class ArithmeticCalculatorI {
  const ArithmeticCalculatorI();

  String f(
    String operation,
    String text, [
    double Function(double, double, String)? calc,
  ]) {
    calc ??= _doCalc;

    while (text.contains(operation)) {
      // removes all (+-) conflicts
      if (operation == "-") text = text.replaceAll('+-', '-');

      text = text.replaceFirstMapped(
          RegExp('([-]?\\d*\\.?\\d+[$operation]\\d*\\.?\\d+)'), (match) {
        List<String>? splitedText = match.group(1)?.split(operation);

        // if list is null
        if (splitedText == null) return '';

        // it works in case => (-3-1) -> it splits => ['', '3', '1'], operation is -> "-"
        // we must delete ('') in -> ['', '3', '1'] and replase ('3') to ('-3')
        if (splitedText.contains('')) {
          splitedText.remove('');
          splitedText[0] = "-${splitedText[0]}";
        }

        return "${splitedText.map((e) => double.parse(e)).reduce((a, b) => calc!(a, b, operation))}";
      });

      if (double.tryParse(text) != null) return text;
    }

    return text;
  }

  double _doCalc(double a, double b, String operation) {
    if (operation == '/') return a / b;
    if (operation == '*') return a * b;
    if (operation == '-') return a - b;
    if (operation == '+') return a + b;
    return 0;
  }
}
