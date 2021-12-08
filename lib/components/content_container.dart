import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentContainer extends StatelessWidget {
  final Widget? child;
  const ContentContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color.fromRGBO(213, 243, 253, 0.5),
          Color.fromRGBO(234, 236, 198, 0.5),
        ]),
        border: Border.all(color: Colors.black87, width: 3),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: child,
    );
  }
}
