import 'package:flutter/material.dart';
import 'package:zakat/data.dart';

class ZakatConditions extends StatelessWidget {
  static const String id = 'conditions';
  const ZakatConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(15),
                    decoration: decoration,
                    child: Text(
                      "شروط الزكاة",
                      style: style1,
                    ),
                  ),
                  Container(
                    decoration: decoration,
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      conditions,
                      style: style2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
