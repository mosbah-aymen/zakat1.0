import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  final String title;
  final String image;
  const Service({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // decoration: BoxDecoration(
        //     border: Border.all(
        //       color: Colors.white,
        //       width: 1,
        //     ),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.blueGrey.withOpacity(0.4),
        //         spreadRadius: 0,
        //         blurRadius: 1,
        //       ),
        //     ],
        //     borderRadius: const BorderRadius.all(Radius.circular(20))),
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 6,
                          spreadRadius: 0,
                          offset: Offset(1, 0))
                    ]),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    image,
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                title,
                style: style,
              ),
            )
          ],
        ));
  }

  // style of title
  final TextStyle style = const TextStyle(
    color: Colors.white,
    fontSize: 18,
  );
}
