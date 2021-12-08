import 'package:flutter/material.dart';
import 'package:zakat/data.dart';

class MassarifZakat extends StatelessWidget {
  static const String id = 'massarif';

  const MassarifZakat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(15),
                          decoration: decoration,
                          child: Text(
                            "مصارف الزكاة",
                            style: style1,
                          ),
                        ),
                        Container(
                          decoration: decoration,
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            "الزكاة كما لا يخفى، لا بد لأن تكون في موضع القبول أن تصرف في مصارفها الشرعية، والتي حددها الله عزو جل في قوله: {إِنَّمَا الصَّدَقَاتُ لِلْفُقَرَاءِ وَالْمَسَاكِينِ وَالْعَامِلِينَ عَلَيْهَا وَالْمُؤَلَّفَةِ قُلُوبُهُمْ وَفِي الرِّقَابِ وَالْغَارِمِينَ وَفِي سَبِيلِ اللَّهِ وَابْنِ السَّبِيلِ فَرِيضَةً مِنَ اللَّهِ وَاللَّهُ عَلِيمٌ حَكِيمٌ} [التوبة:60]، فهؤلاء المذكورون في هذه الآية الكريمة هم أهل الزكاة الذين جعلهم الله محلاً لدفعها إليهم, لا يجوز صرف شيء منها إلى غيرهم إجماعاً."
                            "   ولا يجوز صرف الزكاة في غير هذه المصارف التي عينها الله من المشاريع الخيرية الأخرى, كبناء المساجد والمدارس,  لقوله تعالى: {إِنَّمَا الصَّدَقَاتُ لِلْفُقَرَاءِ وَالْمَسَاكِينِ} الآية, و (إنما) تفيد الحصر, وتثبت الحكم لما بعدها, وتنفيه عما سواه, والمعنى: ليست الصدقات لغير هؤلاء, بل لهؤلاء خاصة, وإنما سمى الله الأصناف الثمانية, إعلاماً منه أن الصدقة لا تخرج من هذه الأصناف إلى غيرها.",
                            style: style2,
                          ),
                        ),
                        // Container(
                        //   decoration: decoration,
                        //   margin: const EdgeInsets.symmetric(vertical: 8),
                        //   padding: const EdgeInsets.all(8),
                        //   child: RichText(
                        //     text: TextSpan(
                        //         text: " الفقير : ",
                        //         style: style1,
                        //         children: [
                        //           TextSpan(
                        //               style: style2,
                        //               text:
                        //                   "من لیس له من المال ما یسد حاجته وحاجة من یعول (على من ینفق)."),
                        //         ]),
                        //   ),
                        // ),
                      ] +
                      allMassarif(),
                ),
              )),
        ),
      ),
    );
  }

  Widget element(String title, String description) => Container(
        decoration: decoration,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(8),
        child: RichText(
          text: TextSpan(text: " $title : ", style: style1, children: [
            TextSpan(style: style2, text: description),
          ]),
        ),
      );

  List<Widget> allMassarif() {
    List<Widget> tmp = [];
    massarif.forEach((key, value) {
      tmp.add(element(key, value));
    });
    return tmp;
  }
}
