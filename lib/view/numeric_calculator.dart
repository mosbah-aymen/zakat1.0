import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakat/components/content_container.dart';
import 'package:zakat/components/input_field.dart';
import 'package:zakat/components/zakat_result.dart';
import 'package:zakat/models/numeraires.dart';

class NumericCalculator extends StatefulWidget {
  static const String id = "numeric";
  const NumericCalculator({Key? key}) : super(key: key);

  @override
  State<NumericCalculator> createState() => _NumericCalculatorState();
}

class _NumericCalculatorState extends State<NumericCalculator> {
  final InputBorder border = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(16),
    ),
    borderSide: BorderSide(color: Colors.white, width: 2),
  );
  double value = 0;
  double zakat = 0;
  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "يرجى كتابة قيمة المبلغ الذي حال عليه الحول",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                InputField(
                  onChanged: (x) {
                    setState(() {
                      value = double.tryParse(x) ?? 0;
                      calculate();
                    });
                  },
                  unit: "دج",
                  validator: (s) => !Numeric.hasNissab(double.tryParse(s!) ?? 0)
                      ? "مالك لم بلغ النصاب بعد \n"
                          "( ${Numeric.quorum} دج )"
                      : null,
                ),
                ZakatResult(zakat: zakat),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculate() {
    if (Numeric.hasNissab(value)) {
      zakat = Numeric.calculate(value);
    } else {
      zakat = 0;
    }
  }
}
