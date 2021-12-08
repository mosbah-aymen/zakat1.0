import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zakat/components/content_container.dart';
import 'package:zakat/components/input_field.dart';
import 'package:zakat/components/select_metal.dart';
import 'package:zakat/components/zakat_result.dart';
import 'package:zakat/data.dart';
import 'package:zakat/models/or_argent.dart';

class GoldCalculator extends StatefulWidget {
  static const String id = "gold";
  const GoldCalculator({Key? key}) : super(key: key);
  @override
  State<GoldCalculator> createState() => _GoldCalculatorState();
}

class _GoldCalculatorState extends State<GoldCalculator> {
  int carat = 0;
  int quorum = 0;
  double zakat = 0;
  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "اختر المعدن",
                  style: style1,
                ),
                SelectMetal(
                  function: (c) {
                    setState(() {
                      carat = c;
                      calculate();
                    });
                  },
                ),
                InputField(
                  onChanged: (s) {
                    quorum = int.tryParse(s) ?? 0;
                    setState(() {
                      calculate();
                    });
                  },
                  validator: (s) =>
                      !Metals.hasQuorum(carat, int.tryParse(s!) ?? 0)
                          ? "مالك لم بلغ النصاب بعد \n"
                              "( ${Metals.getQuorum(carat)} غرام )"
                          : null,
                ),
                ZakatResult(
                  zakat: zakat,
                  unit: "g",
                  carat: carat,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculate() {
    if (Metals.hasQuorum(carat, quorum)) {
      zakat = Metals.calculate(quorum.toDouble());
    } else {
      zakat = 0;
    }
  }
}
