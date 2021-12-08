import 'package:flutter/material.dart';
import 'package:zakat/components/content_container.dart';
import 'package:zakat/components/input_field.dart';
import 'package:zakat/components/zakat_result.dart';
import 'package:zakat/models/agricoles.dart';

class AgricolesCalculator extends StatefulWidget {
  static const String id = "agricole";
  const AgricolesCalculator({Key? key}) : super(key: key);

  @override
  State<AgricolesCalculator> createState() => _AgricolesCalculatorState();
}

class _AgricolesCalculatorState extends State<AgricolesCalculator> {
  bool isNatural = true;
  double zakat = 0, value = 0;

  int selectedRadioTile = 0;
  setSelectedRadioTile(Object? val) {
    setState(() {
      isNatural = val as bool;
      calculate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                Card(
                  child: RadioListTile(
                    value: true,
                    groupValue: isNatural,
                    title: const Text("سقي طبيعي"),
                    subtitle: const Text("بالسيل و المطر أو الأنهار"),
                    onChanged: (val) {
                      setSelectedRadioTile(val);
                    },
                    activeColor: Colors.green.shade700,
                    selected: isNatural,
                  ),
                ),
                Card(
                  child: RadioListTile(
                    value: false,
                    groupValue: isNatural,
                    title: const Text("سقي غير طبيعي"),
                    subtitle:
                        const Text("سقيت بالآلات أو الدواليب أو الحيوانات"),
                    onChanged: (val) {
                      setSelectedRadioTile(val);
                    },
                    activeColor: Colors.green.shade700,
                    selected: !isNatural,
                  ),
                ),
                InputField(
                  onChanged: (s) {
                    value = double.tryParse(s) ?? 0;
                    setState(() {
                      calculate();
                    });
                  },
                  validator: null,
                  unit: "Kg",
                ),
                ZakatResult(
                  zakat: zakat,
                  unit: "Kg",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculate() {
    zakat = Agricoles.calculate(value, isNatural);
  }
}
