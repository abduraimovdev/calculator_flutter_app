import 'package:calculator/service/arithmetic_calculator.dart';

class Calc {
  static bool historyBool = false;
  static String input = "0";
  static String history = "";

  void viewAnswer() {
    String? answer = const ArithmeticCalculator().calculate(input);
    if (answer == null) return;
    // if ((double.tryParse(answer) ?? 0) <= 0) {
    //   answer = "0";
    // }
    var regex = RegExp(r"[\.0*]$");
    if (regex.hasMatch(answer)) {
      answer = double.tryParse(answer)!.toInt().toString();
    }
    history += "\n\n$input=$answer";
    input = answer;
  }

  void viewHistory() {
    if (historyBool) {
      historyBool = false;
    } else {
      historyBool = true;
    }
  }

  void back() {
    if (input != "0") {
      input = input.substring(0, input.length - 1);
    }
    if (input.isEmpty) {
      input = "0";
    }
  }

  void clear() {
    input = "0";
  }

  // void addSymbol(String symbol) {
  //   if (input[input.length - 1].contains("[+ * / % -]")) return;
  //   if (symbol == ".") {
  //     if (input.contains(
  //       ".",
  //     )) return;
  //   }
  //   if (int.tryParse(symbol) != null && input == "0") {
  //     input = symbol.trim();
  //   } else {
  //     input += symbol.trim();
  //   }
  // }

  void addNumber(String number) {
    if (input[input.length - 1].contains("[+ * / % -]")) return;
    if (number == ".") {
      if (input.contains(
        ".",
      )) return;
    }
    if (int.tryParse(number) != null && input == "0") {
      input = number.trim();
    } else {
      input += number.trim();
    }
  }

  void addSymbol(String symbol) {
    var regex = RegExp(r"[%+*]$");
    if (regex.hasMatch(input[input.length - 1]) ||
        input[input.length - 1] == "/" ||
        input[input.length - 1] == "-") {
      return;
    } else {
      input += symbol.trim();
    }
  }
}
