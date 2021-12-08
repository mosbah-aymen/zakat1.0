import 'package:flutter/material.dart';

class Archive extends StatelessWidget {
  static const String id = "archive";
  const Archive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "تعاملاتك السابقة",
          style: TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const SafeArea(
        child: Center(
          child: Text(
            "لا توجد أي معاملات سابقة",
            style: TextStyle(
              fontSize: 26,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
