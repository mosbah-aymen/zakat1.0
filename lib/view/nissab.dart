import 'package:flutter/material.dart';
import 'package:zakat/components/zakat_result.dart';
import 'package:zakat/data.dart';

class Nissab extends StatelessWidget {
  const Nissab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: const Center(
          child: ZakatResult(
        zakat: 705500,
        isNissab: true,
      )),
    );
  }
}
