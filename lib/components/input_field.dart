import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakat/data.dart';

class InputField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? unit;
  const InputField(
      {Key? key, required this.onChanged, required this.validator, this.unit})
      : super(key: key);
  final OutlineInputBorder border = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black54, width: 3),
      gapPadding: 20,
      borderRadius: BorderRadius.all(Radius.circular(20)));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          onChanged: onChanged,
          style: const TextStyle(fontSize: 52, color: Colors.black),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          cursorColor: Colors.white,
          validator: validator,
          textDirection: TextDirection.ltr,
          autovalidateMode: AutovalidateMode.always,
          decoration: InputDecoration(
            hintText: "0",
            errorStyle: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            hoverColor: color,
            hintStyle: const TextStyle(fontSize: 52, color: Colors.black54),
            enabledBorder: border,
            errorBorder: border,
            border: border,
            focusedBorder:
                border.copyWith(borderSide: const BorderSide(width: 3)),
            disabledBorder: border,
            suffixIcon: Text(
              unit ??
                  "غرام\n"
                      "g",
              textAlign: TextAlign.center,
              style: style1,
            ),
            filled: true,
            fillColor: Colors.white10,
          ),
        ),
      ),
    );
  }
}
