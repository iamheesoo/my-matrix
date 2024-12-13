import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  String name;
  int age;
  String gender;
  bool isKorean;

  SecondPage(
      {required this.name, required this.age, required this.gender, required this.isKorean});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("SecondPage")),
        body: Column(
          children: [
            Text(name),
            Text("$age"),
            Text(gender),
            Text("$isKorean")
          ],
        )
    );
  }
}
