import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakat/data.dart';

class NissabBottomSheet extends StatelessWidget {
  const NissabBottomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(213, 243, 253, 0.5),
          Color.fromRGBO(234, 236, 198, 0.5),
        ]),
      ),
      height: MediaQuery.of(context).size.height * 0.89,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "ما هو نصاب الزكاة؟",
                  style: style1,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                trailing: const Icon(
                  CupertinoIcons.down_arrow,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              Divider(
                color: Colors.white,
                endIndent: MediaQuery.of(context).size.width * 0.4,
              ),
              Text(
                "نصاب الزّكاة هو القَدْر المُحدّد الذي لا تجب الزّكاة فيما دونه أو أقلّ منه، ويكون اختلاف هذا النّصاب بحسْبِ الأموال المُزكّى بها، وهو شرطٌ من شروط وجوب الزّكاة على المسلم، وللنّصاب شرطان أساسيّان، هما كالآتي:\n   -أن يكون زائداً عن الحاجة المُلحّة للمسلم، كالتي لا يمكن الاستغناء عنها، كمطعمه، وملبسه، ومسكنه، ومركبه، وآلاته الحِرفيّة. \n   -أن يكون قد حالَ عليه حَولٌ هجريٌّ كامل، وبدؤه من يوم مِلْك النّصاب، وذلك لحديث أمّ المؤمنين عائشة -رضي الله عنها- حيث قالت: (لا زكاة في مالٍ حتى يحولَ عليه الحولُ)، ويخرجُ من هذا الشّرط زكاة الزورع والثمار، حيث تجبُ الزّكاة فيها يوم حصادها، لقوله -تعالى: {'' وَآتوا حَقَّهُ يَومَ حَصادِهِ ''}.",
                style: style2,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(5),
                decoration: decoration,
                child: Column(
                  children: [
                    Text(
                      "نصاب الذهب يساوي: 85 غرام",
                      style: style1,
                    ),
                    Text(
                      "سعر الغرام 7282 دينار ",
                      style: style2,
                    ),
                    Text(
                      "نصاب الفضة يساوي: 595 غرام",
                      style: style1,
                    ),
                    Text(
                      "سعر الغرام 110.19 دينار ",
                      style: style2,
                    ),
                  ],
                ),
              ),
              Text(
                'فيكون النصاب بالدينار: ',
                style: style1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: decoration,
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "نصاب الذهب\n ${85 * 7282}",
                      textAlign: TextAlign.center,
                      style: style1,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: decoration,
                    child: Text(
                      "نصاب الفضة\n ${595 * 110}",
                      textAlign: TextAlign.center,
                      style: style1,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
