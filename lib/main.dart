import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_matrix/page/SecondPage.dart';

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
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(color: Colors.purple),
                ),
                Expanded(
                  flex: 1,
                  child: Container(color: Colors.pink),
                ),
                Expanded(
                  flex: 1,
                  child: Container(color: Colors.yellow),
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
          GestureDetector(
            onTap: () {
              Get.to(SecondPage(
                isKorean: false,
                name: "JOHN",
                age: 20,
                gender: "F",
              ));
            },
            child: Container(
              child: Text("goToSecond"),
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
