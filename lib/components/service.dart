import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakat/data.dart';

class Service extends StatelessWidget {
  final String title;
  final String image;
  final String routeName;
  const Service(
      {Key? key,
      required this.title,
      required this.image,
      required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, routeName);
                },
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                title,
                style: style1,
              ),
            )
          ],
        ));
  }

  // style of title

}
