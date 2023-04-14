import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String son = "8";
  String history =
      "2+2=4\n4+4=82+2=4\n4+4=82+2=4\n4+4=82+2=4\n4+4=82+2=4\n4+4=8";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              alignment: Alignment.bottomRight,
              child: Container(
                width: double.infinity,
                height: 250,
                alignment: Alignment.bottomRight,
                child: SingleChildScrollView(
                  reverse: true,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 10, left: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.bottomRight,
                          width: 300,
                          child: Text(
                            history,
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          son,
                          style: TextStyle(
                            fontSize: son.length < 12
                                ? 70
                                : (son.length < 26 ? 50 : 30),
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
            flex: 2,
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
                              onPressed: () {
                                setState(() {
                                  son = "0";
                                });
                              },
                              name: "C",
                              color: Colors.orange),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (son != "0") {
                                    son = son.substring(0, son.length - 1);
                                  } 
                                  if (son.isEmpty) {
                                    son = "0";
                                  }
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(5, 10, 5, 10),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: double.maxFinite,
                                  color: Colors.white,
                                  child: const Icon(
                                    Icons.backspace_outlined,
                                    size: 40,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          MyButton(
                              onPressed: () {},
                              name: "%",
                              color: Colors.orange),
                          MyButton(
                              onPressed: () {},
                              name: "/",
                              color: Colors.orange),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          MyButton(
                              onPressed: () {},
                              name: "7",
                              color: Colors.orange),
                          MyButton(
                              onPressed: () {},
                              name: "8",
                              color: Colors.orange),
                          MyButton(
                              onPressed: () {},
                              name: "9",
                              color: Colors.orange),
                          MyButton(
                              onPressed: () {},
                              name: "*",
                              color: Colors.orange),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          MyButton(
                              onPressed: () {},
                              name: "4",
                              color: Colors.orange),
                          MyButton(
                              onPressed: () {},
                              name: "5",
                              color: Colors.orange),
                          MyButton(
                              onPressed: () {},
                              name: "6",
                              color: Colors.orange),
                          MyButton(
                              onPressed: () {},
                              name: "-",
                              color: Colors.orange),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          MyButton(
                              onPressed: () {},
                              name: "1",
                              color: Colors.orange),
                          MyButton(
                              onPressed: () {},
                              name: "2",
                              color: Colors.orange),
                          MyButton(
                              onPressed: () {},
                              name: "3",
                              color: Colors.orange),
                          MyButton(
                              onPressed: () {},
                              name: "+",
                              color: Colors.orange),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          MyButton(
                              onPressed: () {}, name: "", color: Colors.orange),
                          MyButton(
                              onPressed: () {},
                              name: "0",
                              color: Colors.orange),
                          MyButton(
                              onPressed: () {},
                              name: ".",
                              color: Colors.orange),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(5, 10, 5, 10),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: double.maxFinite,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Text(
                                    "=",
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
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

class MyButton extends StatelessWidget {
  final void Function() onPressed;
  final String name;
  final Color color;

  const MyButton(
      {Key? key,
      required this.onPressed,
      required this.name,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
          child: Container(
            alignment: Alignment.center,
            height: double.maxFinite,
            color: Colors.white,
            child: Text(
              name,
              style: TextStyle(
                fontSize: 40,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
