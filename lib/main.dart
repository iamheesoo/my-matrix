import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_matrix/main_viewmodel.dart';
import 'package:my_matrix/matrix.dart';
import 'package:my_matrix/page/check_list_view.dart';
import 'package:my_matrix/task.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider.value(
      value: MainViewModel(), child: const MyApp()));
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
    final viewModel = Provider.of<MainViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            child: const Text(
              "Add Todo",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {
              // todo jhs show dialog
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 200,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Title"),
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("close")),
                                ElevatedButton(
                                    onPressed: () {
                                      // todo jhs db에 저장
                                      Task task = Task(isChecked: false, title: "editText");
                                      viewModel.addTask(Matrix.urgentImportant, task);
                                    },
                                    child: Text("add"))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
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
                    matrix: Matrix.urgentImportant,
                    taskList: viewModel.getTaskList(Matrix.urgentImportant),
                  )),
              // top-right
              Positioned(
                  left: halfWidth,
                  top: 0,
                  width: halfWidth,
                  height: halfHeight,
                  child: CheckListView(
                    matrix: Matrix.notUrgentImportant,
                    taskList: viewModel.getTaskList(Matrix.notUrgentImportant),
                  )),
              // bottom-left
              Positioned(
                  left: 0,
                  top: halfHeight,
                  width: halfWidth,
                  height: halfHeight,
                  child: CheckListView(
                    matrix: Matrix.urgentNotImportant,
                    taskList: viewModel.getTaskList(Matrix.urgentNotImportant),
                  )),
              // bottom-right
              Positioned(
                  left: halfWidth,
                  top: halfHeight,
                  width: halfWidth,
                  height: halfHeight,
                  child: CheckListView(
                    matrix: Matrix.notUrgentNotImportant,
                    taskList:
                        viewModel.getTaskList(Matrix.notUrgentNotImportant),
                  ))
            ],
          );
        }));
  }
}
