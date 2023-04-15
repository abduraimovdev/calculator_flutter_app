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
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
          child: Container(
            alignment: Alignment.center,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(50),
            ),
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
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
          child: Container(
            alignment: Alignment.center,
            height: double.maxFinite,
            color: Colors.white,
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
