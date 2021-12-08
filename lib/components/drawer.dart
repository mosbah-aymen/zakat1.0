import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakat/view/massarif_zakat.dart';
import 'package:zakat/view/zakat_conditions.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(213, 243, 253, 0.5),
              Color.fromRGBO(234, 236, 198, 0.5),
            ]),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: const [
                DrawerHeader(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 120,
                      color: Color.fromRGBO(46, 52, 64, 1), //color
                    ),
                  ),
                ),
                Text(
                  "اسم المستخدم",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                DrawerItem(title: "شروط الزكاة", id: ZakatConditions.id),
                DrawerItem(title: "مصارف الزكاة", id: MassarifZakat.id),
                DrawerItem(title: "الأرشيف", id: "archive"),
                DrawerItem(title: "النصاب", id: "nissab"),
                DrawerItem(title: "اتصل بنا", id: "contact"),
                Expanded(
                  child: Center(
                    child: Text(
                      "عن أبي الدرداء رضي الله عنه قال: قال رسول الله صلى الله عليه وسلم (خمس من جاء بهن مع إيمان دخل الجنة: من حافظ على الصلوات الخمس على وضوئهن وركوعهن وسجودهن ومواقيتهن، وصام رمضان، وحج البيت إن استطاع إليه سبيلاً، وأعطى الزكاة طيبة بها نفسه)",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "ReemKufi",
                          letterSpacing: 7.5,
                          fontWeight: FontWeight.w100,
                          overflow: TextOverflow.fade),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final String id;
  const DrawerItem({Key? key, required this.title, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        onTap: () {
          Navigator.popAndPushNamed(context, id);
        },
        title: Text(
          title,
        ),
        trailing: const Icon(
          CupertinoIcons.arrow_left_circle,
        ),
      ),
    );
  }
}
