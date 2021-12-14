import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zakat/components/bottom_sheet_nissab.dart';
import 'package:zakat/components/convert_to_da.dart';

class ZakatResult extends StatefulWidget {
  final double zakat;
  final String? unit;
  final int? carat;
  final bool isNissab;
  const ZakatResult(
      {Key? key,
      required this.zakat,
      this.isNissab = false,
      this.carat,
      this.unit})
      : super(key: key);

  @override
  State<ZakatResult> createState() => _ZakatResultState();
}

class _ZakatResultState extends State<ZakatResult>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          RotationTransition(
            turns: animation,
            child: Container(
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(12),
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(213, 243, 253, 1),
                    Color.fromRGBO(234, 236, 198, 1),
                  ]),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 15,
                        color: Colors.black.withOpacity(0.9),
                        offset: const Offset(0, 0)),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(2000)),
                  border: Border.all(color: Colors.teal, width: 2)),
            ),
          ),
          GestureDetector(
            onTap: () {
              showBottomSheet(
                  context: context,
                  elevation: 15,
                  builder: (context) => widget.carat != null
                      ? ConvertToDA(
                          carat: widget.carat,
                          gram: widget.zakat.round(),
                        )
                      : const NissabBottomSheet());
            },
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: widget.zakat),
              duration: const Duration(milliseconds: 500),
              builder: (context, double duration, child) {
                return Center(
                  child: Text(
                    (widget.isNissab ? "قيمة النصاب" : "قيمة الزكاة") +
                        "\n"
                            "${duration.toStringAsFixed(0)}\n" +
                        (widget.unit ?? " DA"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          BoxShadow(
                              offset: Offset(1, 1.5),
                              spreadRadius: 17,
                              blurRadius: 7,
                              color: Colors.black26)
                        ]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
