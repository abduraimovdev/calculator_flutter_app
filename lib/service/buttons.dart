import 'package:flutter/material.dart';

// Text Button

class MyButton extends StatelessWidget {
  final void Function() onPressed;
  final String name;
  final Color color;
  final Color backgroundColor;

  const MyButton({
    Key? key,
    required this.onPressed,
    required this.name,
    required this.color,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => (states.contains(MaterialState.pressed))
                  ? Colors.orange.withOpacity(0.1)
                  : backgroundColor,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            height: double.maxFinite,
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

// Icon Button

class MyIconButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final Color color;

  const MyIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => (states.contains(MaterialState.pressed))
                  ? Colors.orange.withOpacity(0.1)
                  : Colors.white,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            height: double.maxFinite,
            child: Icon(
              icon,
              size: 40,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

// AnswerButtons -----------------------------
class AnswerButton extends StatelessWidget {
  final void Function() onPressed;
  final String name;
  const AnswerButton({
    super.key,
    required this.onPressed,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 30,
          color: Colors.black,
        ),
      ),
    );
  }
}
