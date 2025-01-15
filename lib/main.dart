import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_matrix/page/check_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "hello",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        body:
        Column(
          children: [
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Expanded(child: CheckListView()), Expanded(child: CheckListView())],
            )),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Expanded(child: CheckListView()), Expanded(child: CheckListView())],
            )),
          ],
        ));
  }
}
