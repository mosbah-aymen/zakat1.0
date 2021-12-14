import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zakat/view/agricoles_calculator.dart';
import 'package:zakat/view/archive.dart';
import 'package:zakat/view/betail_calculator.dart';
import 'package:zakat/view/gold_calculator.dart';
import 'package:zakat/view/home.dart';
import 'package:zakat/view/massarif_zakat.dart';
import 'package:zakat/view/nissab.dart';
import 'package:zakat/view/numeric_calculator.dart';
import 'package:zakat/view/zakat_conditions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          NumericCalculator.id: (context) => const NumericCalculator(),
          AgricolesCalculator.id: (context) => const AgricolesCalculator(),
          GoldCalculator.id: (context) => const GoldCalculator(),
          BetailCalculator.id: (context) => const BetailCalculator(),
          ZakatConditions.id: (context) => const ZakatConditions(),
          MassarifZakat.id: (context) => const MassarifZakat(),
          Archive.id: (context) => const Archive(),
          "nissab": (context) => const Nissab(),
        },
        theme: ThemeData(
            textTheme:
                const TextTheme(bodyText1: TextStyle(fontFamily: "ReemFuffi"))),
        debugShowCheckedModeBanner: false,
      ),
    );
  });
}
