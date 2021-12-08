import 'package:flutter/material.dart';
import 'package:zakat/data.dart';

class SelectMetal extends StatefulWidget {
  final Function function;
  const SelectMetal({Key? key, required this.function(int carat)})
      : super(key: key);

  @override
  _SelectMetalState createState() => _SelectMetalState();
}

class _SelectMetalState extends State<SelectMetal> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MetalItem(
          carat: 24,
          selected: selected,
          onPressed: () {
            selected = 24;
            widget.function(selected);

            setState(() {});
          },
        ),
        MetalItem(
          carat: 21,
          selected: selected,
          onPressed: () {
            setState(() {
              selected = 21;
              widget.function(selected);
            });
          },
        ),
        MetalItem(
          carat: 18,
          selected: selected,
          onPressed: () {
            setState(() {
              selected = 18;
              widget.function(selected);
            });
          },
        ),
        MetalItem(
          carat: 0,
          selected: selected,
          onPressed: () {
            setState(() {
              selected = 0;
              widget.function(selected);
            });
          },
        ),
      ],
    );
  }
}

class MetalItem extends StatelessWidget {
  final int carat;
  final int selected;
  final Function onPressed;
  const MetalItem(
      {Key? key,
      required this.carat,
      required this.onPressed,
      required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ButtonStyle(
          side: selected != carat
              ? null
              : MaterialStateProperty.all(
                  const BorderSide(color: Colors.teal, width: 5)),
          padding: MaterialStateProperty.all(const EdgeInsets.all(6)),
          elevation: MaterialStateProperty.all(5),
          shadowColor: MaterialStateProperty.all(Colors.white60),
          backgroundColor: MaterialStateProperty.all(
            carat == 0
                ? const Color.fromRGBO(152, 152, 159, 1)
                : Colors.yellow.shade700,
          ),
        ),
        child: Column(
          children: [
            Text(
              carat == 0 ? "فضة" : "ذهب",
              style: style1
              // TextStyle(
              //   fontSize: 24,
              //   fontWeight: FontWeight.bold,
              //   color: ,
              // )
              ,
              textAlign: TextAlign.center,
            ),
            CircleAvatar(
              backgroundColor: color,
              child: Text(
                carat == 0 ? "Ag" : '$carat',
                style: style1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
