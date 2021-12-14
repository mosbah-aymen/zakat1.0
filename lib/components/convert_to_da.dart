import 'package:flutter/material.dart';
import 'package:zakat/data.dart';
import 'package:zakat/models/or_argent.dart';

class ConvertToDA extends StatelessWidget {
  final int gram;
  final int? carat;
  const ConvertToDA({Key? key, required this.carat, this.gram = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    num da = calculate();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(213, 243, 253, 0.5),
          Color.fromRGBO(234, 236, 198, 0.5),
        ]),
      ),
      height: MediaQuery.of(context).size.height * 0.4,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "تساوي قيمة غرام واحد من (${Metals.getNameInArByCarat(carat!)}) :"
              "\n"
              "  ${Metals.getPriceByCarat(carat!)} دينار ",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 26),
            ),
            Expanded(
              child: Container(
                decoration: decoration,
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "غرام:",
                            style: style,
                          ),
                          Text(
                            "$gram ",
                            style: style,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "الدينار:",
                            style: style,
                          ),
                          Text(
                            "$da",
                            style: style,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final TextStyle style = const TextStyle(
    color: Colors.teal,
    fontSize: 32,
  );

  num calculate() {
    return carat == 24
        ? 8323 * gram
        : carat == 18
            ? 6242 * gram
            : carat == 21
                ? 7282 * gram
                : 100.25 * gram;
  }
}
