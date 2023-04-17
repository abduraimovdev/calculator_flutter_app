import 'package:calculator/service/calc.dart';
import 'package:flutter/material.dart';
import '../service/buttons.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  Calc calc = Calc();
  void viewAnswer() => setState(calc.viewAnswer);

  void viewHistory() => setState(calc.viewHistory);

  void back() => setState(calc.back);

  void clear() => setState(calc.clear);

  void addNumber(String number) => setState(() => calc.addNumber(number));
  void addSymbol(String symbol) => setState(() => calc.addSymbol(symbol));

  List<AnswerButton> answers() {
    List<AnswerButton> result = [];
    for (var data in Calc.dataHistory.entries) {
      String answer = "${data.value[0]}=${data.value[1]}";
      result.add(
        AnswerButton(
          name: answer,
          onPressed: () {
            setState(() {
              Calc.input = data.value[0];
            });
          },
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              alignment: Alignment.bottomRight,
              child: Container(
                width: double.infinity,
                height: 250,
                color: Colors.white,
                alignment: Alignment.bottomRight,
                child: SingleChildScrollView(
                  reverse: true,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 20,
                      bottom: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Calc.historyBool
                            ? Container(
                                alignment: Alignment.bottomRight,
                                width: 300,
                                child: Column(
                                  children: answers(),
                                ),
                              )
                            : const SizedBox(
                                height: 20,
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          Calc.input,
                          style: TextStyle(
                            fontSize: Calc.input.length < 12
                                ? 70
                                : (Calc.input.length < 26 ? 50 : 30),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Calc Number Buttons, --------------------------

          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                left: 5,
                right: 5,
                top: 5,
              ),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          MyButton(
                            name: "C",
                            onPressed: clear,
                            color: Colors.orange,
                          ),
                          MyIconButton(
                            icon: Icons.backspace_outlined,
                            onPressed: back,
                            color: Colors.orange,
                          ),
                          MyButton(
                            name: "%",
                            onPressed: () => addSymbol("%"),
                            color: Colors.orange,
                          ),
                          MyButton(
                            name: "/",
                            onPressed: () => addSymbol("/"),
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          MyButton(
                            name: "7",
                            onPressed: () => addNumber("7"),
                            color: Colors.orange,
                          ),
                          MyButton(
                            name: "8",
                            onPressed: () => addNumber("8"),
                            color: Colors.orange,
                          ),
                          MyButton(
                            name: "9",
                            onPressed: () => addNumber("9"),
                            color: Colors.orange,
                          ),
                          MyButton(
                            name: "*",
                            onPressed: () => addSymbol("*"),
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          MyButton(
                            name: "4",
                            onPressed: () => addNumber("4"),
                            color: Colors.orange,
                          ),
                          MyButton(
                            name: "5",
                            onPressed: () => addNumber("5"),
                            color: Colors.orange,
                          ),
                          MyButton(
                            name: "6",
                            onPressed: () => addNumber("6"),
                            color: Colors.orange,
                          ),
                          MyButton(
                            name: "-",
                            onPressed: () => addSymbol("-"),
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          MyButton(
                            name: "1",
                            onPressed: () => addNumber("1"),
                            color: Colors.orange,
                          ),
                          MyButton(
                            name: "2",
                            onPressed: () => addNumber("2"),
                            color: Colors.orange,
                          ),
                          MyButton(
                            name: "3",
                            onPressed: () => addNumber("3"),
                            color: Colors.orange,
                          ),
                          MyButton(
                            name: "+",
                            onPressed: () => addSymbol("+"),
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          MyIconButton(
                            icon: Icons.history,
                            onPressed: viewHistory,
                            color: Colors.orange,
                          ),
                          MyButton(
                            name: "0",
                            onPressed: () => addNumber("0"),
                            color: Colors.orange,
                          ),
                          MyButton(
                            name: ".",
                            onPressed: () => addNumber("."),
                            color: Colors.orange,
                          ),
                          MyButton(
                            name: "=",
                            onPressed: viewAnswer,
                            color: Colors.white,
                            backgroundColor: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}








// Container(
//                                 alignment: Alignment.bottomRight,
//                                 width: 300,
//                                 child: Text(
//                                   Calc.history,
//                                   style: const TextStyle(
//                                     fontSize: 30,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               )