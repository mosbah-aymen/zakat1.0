import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final Function onPressed;
  CalculateButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle,
      onPressed: onPressed(),
      child: const Text(
        "حساب",
        style: TextStyle(
            fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  final ButtonStyle buttonStyle = ButtonStyle(
    animationDuration: const Duration(seconds: 2),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(11.0),
    )),
    foregroundColor: MaterialStateProperty.all(Colors.teal),
    fixedSize: MaterialStateProperty.all(const Size(150, 50)),
    side: MaterialStateProperty.all(
        const BorderSide(color: Colors.white, width: 1)),
    elevation: MaterialStateProperty.all(15),
    shadowColor: MaterialStateProperty.all(Colors.black),
    backgroundColor: MaterialStateProperty.all(Colors.black54),
  );
}
