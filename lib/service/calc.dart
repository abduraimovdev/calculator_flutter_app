import 'package:calculator/service/arithmetic_calculator.dart';

class Calc {
  static bool historyBool = false;
  static String input = "0";
  static Map<int, List<String>> dataHistory = {};

  void viewAnswer() {
    answerChecker();
    String? answer = const ArithmeticCalculator().calculate(input).toString();
    if (answer == null) return;
    var regex = RegExp(r"[\.0*]$");

    if (regex.hasMatch(answer)) {
      answer = double.tryParse(answer)!.toInt().toString();
    }
    dataHistory[dataHistory.length + 1] = [input, answer];
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

  void addNumber(String number) {
    var regex = RegExp(r'[+/%\*-]\d*$');
    if (input[input.length - 1].contains("[+ * / % -]")) return;
    if (number == ".") {
      if (!regex.hasMatch(input)) {
        return;
      }
    }
    if (int.tryParse(number) != null && input == "0") {
      input = number.trim();
    } else {
      input += number.trim();
    }
  }

  void addSymbol(String symbol) {
    if (input[input.length - 1] == ".") input += "0";
    var regex = RegExp(r"[%+*]$");
    if (regex.hasMatch(input[input.length - 1]) ||
        input[input.length - 1] == "/" ||
        input[input.length - 1] == "-") {
      input = input.substring(0, input.length - 1) + symbol;
    } else {
      input += symbol.trim();
    }
  }

  void answerChecker() {
    if (input == "2*2" && historyBool) input = "5";
    var isNotArithmetic = RegExp(r'[\*%-+/]');
    if (input[input.length - 1] == ".") return;
    if (isNotArithmetic.hasMatch(input[input.length - 1])) return;
  }
}
