
import 'package:flutter/material.dart';
import 'package:my_matrix/matrix.dart';

import 'task.dart';

class MainViewModel extends ChangeNotifier {
  final Map<Matrix, List<Task>> _taskMap = {
    Matrix.urgentImportant : List.empty(),
    Matrix.notUrgentImportant : List.generate(10, (int index) => Task(false, "$index")),
    Matrix.urgentNotImportant : List.empty(),
    Matrix.notUrgentNotImportant : List.generate(100, (int index) => Task(false, "$index"))
  };


  void addTask(Matrix matrix, Task task) {
    _taskMap.putIfAbsent(matrix, () => []).add(task);
    notifyListeners();
  }

  List<Task> getTaskList(Matrix matrix) {
    return _taskMap[matrix] ?? [];
  }
}
