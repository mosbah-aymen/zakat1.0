import 'package:flutter/material.dart';

class BenificiaryList extends StatelessWidget {
  const BenificiaryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, i) => Card(
          child: ListTile(
            title: Text("$i"),
          ),
        ),
      ),
    );
  }
}
