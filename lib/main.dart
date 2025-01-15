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
        body: LayoutBuilder(builder: (context, constraints) {
          final double halfWidth = constraints.maxWidth / 2;
          final double halfHeight = constraints.maxHeight / 2;
          return Stack(
            children: [
              // vertical line
              Positioned(
                left: halfWidth - 1.0,
                top: 0,
                bottom: 0,
                child: Container(width: 2.0, color: Colors.grey),
              ),
              // horizontal line
              Positioned(
                left: 0,
                right: 0,
                top: halfHeight - 1.0,
                child: Container(height: 2.0, color: Colors.grey),
              ),
              // top-left
              Positioned(
                  left: 0,
                  top: 0,
                  width: halfWidth,
                  height: halfHeight,
                  child: CheckListView(
                    title: "Urgent, Important",
                    checkList: List.generate(10, (index) => "Item $index"),
                  )),
              // top-right
              Positioned(
                  left: halfWidth,
                  top: 0,
                  width: halfWidth,
                  height: halfHeight,
                  child: CheckListView(
                    title: "Not Urgent, Important",
                    checkList: List.empty(),
                  )),
              // bottom-left
              Positioned(
                  left: 0,
                  top: halfHeight,
                  width: halfWidth,
                  height: halfHeight,
                  child: CheckListView(
                    title: "Urgent, Not Important",
                    checkList: List.generate(10, (index) => "Item $index"),
                  )),
              // bottom-right
              Positioned(
                  left: halfWidth,
                  top: halfHeight,
                  width: halfWidth,
                  height: halfHeight,
                  child: CheckListView(
                    title: "Not Urgent, Not Important",
                    checkList: List.generate(100, (index) => "Item $index"),
                  ))
            ],
          );
        }));
  }
}
