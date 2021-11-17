import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakat/components/service.dart';
import 'package:zakat/data.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          )
        ],
      ),
      backgroundColor: const Color.fromRGBO(46, 52, 64, 1),
      body: SafeArea(
          child: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.62,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, i) {
            return Service(
              title: servicesTitles[i],
              image: servicesImages[i],
            );
          },
          itemCount: servicesTitles.length,
        ),
      )),
    );
  }

  // List<Widget> tousLesCalcul() {
  //   List<Widget> tmp = [];
  //   for (String t in servicesTitles) {
  //     tmp.add(Service(title: t));
  //   }
  //   return tmp;
  // }
}
