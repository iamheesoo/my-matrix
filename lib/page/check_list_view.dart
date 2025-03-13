import 'package:flutter/material.dart';
import 'package:my_matrix/task.dart';

import '../matrix.dart';

class CheckListView extends StatefulWidget {
  List<Task> taskList;
  final Matrix matrix;

  CheckListView({required this.taskList, required this.matrix, super.key});

  @override
  _CheckListViewState createState() => _CheckListViewState();
}

class _CheckListViewState extends State<CheckListView> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        widget.matrix.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      Expanded(
          child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int position) {
            return getContainer(context, widget.taskList[position]);
          },
          itemCount: widget.taskList.length,
        ),
      )),
    ]);
  }

  Container getContainer(BuildContext context, Task task) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Checkbox(
              value: task.isChecked,
              onChanged: (bool? isChecked) {
                // todo jhs 클릭하면 db에 저장
                setState(() {
                  Task newTask = task.copyWith(isChecked: isChecked ?? false);
                  widget.taskList[widget.taskList.indexWhere(
                      (element) => element.title == newTask.title)] = newTask;
                });
              }),
          Text(task.title)
        ],
      ),
    );
  }
}
