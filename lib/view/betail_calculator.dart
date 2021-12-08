import 'package:flutter/material.dart';
import 'package:zakat/components/content_container.dart';
import 'package:zakat/components/input_field.dart';
import 'package:zakat/data.dart';
import 'package:zakat/models/betail.dart';

class BetailCalculator extends StatefulWidget {
  static const String id = "betail";
  const BetailCalculator({Key? key}) : super(key: key);

  @override
  State<BetailCalculator> createState() => _BetailCalculatorState();
}

class _BetailCalculatorState extends State<BetailCalculator> {
  setSelectedRadioTile(Object? val) {
    setState(() {
      selectedBetail = val as int;
      calculate();
    });
  }

  int value = 0;
  int selectedBetail = 0;
  String finalResult = "";
  /*
  0 --> chameaux
  1 --> bovin
  2 --> ovin
   */

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                const Text(
                  "يرجى اختيار نوع الماشية",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                RadioListTile(
                  value: 0,
                  groupValue: selectedBetail,
                  title: const Text("الإبل"),
                  subtitle: const Text("النصاب هو 5 رؤوس"),
                  onChanged: (val) {
                    setSelectedRadioTile(val);
                  },
                  activeColor: Colors.green.shade700,
                  contentPadding: const EdgeInsets.all(0),
                  selected: selectedBetail == 0,
                ),
                RadioListTile(
                  value: 1,
                  groupValue: selectedBetail,
                  title: const Text("البقر"),
                  subtitle: const Text("النصاب هو 30 رأسًا"),
                  onChanged: (val) {
                    setSelectedRadioTile(val);
                  },
                  contentPadding: const EdgeInsets.all(0),
                  activeColor: Colors.green.shade700,
                  selected: selectedBetail == 1,
                ),
                RadioListTile(
                  value: 2,
                  contentPadding: const EdgeInsets.all(0),
                  groupValue: selectedBetail,
                  title: const Text("الغنم"),
                  subtitle: const Text("النصاب هو 40 رأسًا"),
                  onChanged: (val) {
                    setSelectedRadioTile(val);
                  },
                  activeColor: Colors.green.shade700,
                  selected: selectedBetail == 2,
                ),
                const Text(
                  "يرجى كتابة عدد المواشي التي حال عليها الحول",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                InputField(
                    onChanged: (s) {
                      setState(() {
                        value = int.tryParse(s) ?? 0;
                        calculate();
                      });
                    },
                    unit: "رأس",
                    validator: (val) => null),
                Container(
                  decoration: decoration,
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    finalResult,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 28, color: Colors.teal),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculate() {
    Map<int, String> result = {};
    finalResult = "";
    switch (selectedBetail) {
      case 0:
        {
          result = Betail.calculerChameaux(value);
          break;
        }
      case 1:
        {
          result = Betail.calculerBovin(value);
          break;
        }
      case 2:
        {
          result = {Betail.calculerOvin(value): "شاة"};
          break;
        }
    }
    result.forEach((key, value) {
      finalResult += "$key $value ";
    });
  }
}
//
// class CircleElement extends StatelessWidget {
//   final String title;
//   final Icon? icon;
//   final String? image;
//   const CircleElement({Key? key, required this.title, this.image, this.icon})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 50,
//       height: 50,
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(100)),
//         border: Border.all(width: 1, color: Colors.white),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           icon ?? Image.asset(image ?? ""),
//           Text(title),
//         ],
//       ),
//     );
//   }
// }
