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
                    padding:
                        const EdgeInsets.only(right: 10, left: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Calc.historyBool
                            ? Container(
                                alignment: Alignment.bottomRight,
                                width: 300,
                                child: Text(
                                  Calc.history,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
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
              padding:
                  const EdgeInsets.only(bottom: 20, left: 5, right: 5, top: 5),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          MyButton(
                            onPressed: clear,
                            name: "C",
                            color: Colors.orange,
                          ),
                          MyIconButton(
                            icon: Icons.backspace_outlined,
                            onPressed: back,
                            color: Colors.orange,
                          ),
                          MyButton(
                            onPressed: () => addSymbol("%"),
                            name: "%",
                            color: Colors.orange,
                          ),
                          MyButton(
                            onPressed: () => addSymbol("/"),
                            name: "/",
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
                            onPressed: () => addNumber("7"),
                            name: "7",
                            color: Colors.orange,
                          ),
                          MyButton(
                            onPressed: () => addNumber("8"),
                            name: "8",
                            color: Colors.orange,
                          ),
                          MyButton(
                            onPressed: () => addNumber("9"),
                            name: "9",
                            color: Colors.orange,
                          ),
                          MyButton(
                            onPressed: () => addSymbol("*"),
                            name: "*",
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
                            onPressed: () => addNumber("4"),
                            name: "4",
                            color: Colors.orange,
                          ),
                          MyButton(
                            onPressed: () => addNumber("5"),
                            name: "5",
                            color: Colors.orange,
                          ),
                          MyButton(
                            onPressed: () => addNumber("6"),
                            name: "6",
                            color: Colors.orange,
                          ),
                          MyButton(
                            onPressed: () => addSymbol("-"),
                            name: "-",
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
                            onPressed: () => addNumber("1"),
                            name: "1",
                            color: Colors.orange,
                          ),
                          MyButton(
                            onPressed: () => addNumber("2"),
                            name: "2",
                            color: Colors.orange,
                          ),
                          MyButton(
                            onPressed: () => addNumber("3"),
                            name: "3",
                            color: Colors.orange,
                          ),
                          MyButton(
                            onPressed: () => addSymbol("+"),
                            name: "+",
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
                            onPressed: viewHistory,
                            icon: Icons.history,
                            color: Colors.orange,
                          ),
                          MyButton(
                            onPressed: () => addNumber("0"),
                            name: "0",
                            color: Colors.orange,
                          ),
                          MyButton(
                            onPressed: () => addNumber("."),
                            name: ".",
                            color: Colors.orange,
                          ),
                          MyButton(
                            onPressed: viewAnswer,
                            name: "=",
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
