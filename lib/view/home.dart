import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zakat/components/drawer.dart';
import 'package:zakat/data.dart';
import 'package:zakat/view/agricoles_calculator.dart';
import 'package:zakat/view/betail_calculator.dart';
import 'package:zakat/view/gold_calculator.dart';
import 'package:zakat/view/numeric_calculator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);
  late String title;
  @override
  Widget build(BuildContext context) {
    title = getTitle(selectedPage);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.handHoldingUsd,
                color: Colors.black,
              ),
              label: "المال"),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.coins,
                color: Colors.black,
              ),
              label: "المعادن"),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.horse,
                color: Colors.black,
              ),
              label: "المواشي"),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.pagelines,
                color: Colors.black,
              ),
              label: "الزروع"),
        ],
        iconSize: 30,
        fixedColor: Colors.black,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        currentIndex: selectedPage,
        onTap: (page) {
          setState(() {
            selectedPage = page;
            pageController.animateToPage(selectedPage,
                duration: const Duration(seconds: 1), curve: Curves.ease);
          });
        },
      ),
      drawer: const MyDrawer(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/back0.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Image.asset("assets/back0.jpg"),
          PageView(
            controller: pageController,
            onPageChanged: (t) {
              setState(() {
                selectedPage = t;
              });
            },
            children: const [
              NumericCalculator(),
              GoldCalculator(),
              BetailCalculator(),
              AgricolesCalculator(),
            ],
          ),
        ],
      ),
    );
  }

  String getTitle(int page) {
    return page == 0
        ? "زكاة المال"
        : page == 1
            ? "زكاة المعادن"
            : page == 2
                ? "زكاة المواشي"
                : "زكاة الزروع";
  }
}
