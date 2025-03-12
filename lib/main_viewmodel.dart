
import 'package:flutter/material.dart';
import 'package:my_matrix/data/database/app_database.dart';
import 'package:my_matrix/matrix.dart';

import 'task.dart';

class MainViewModel extends ChangeNotifier {
  final Map<Matrix, List<Task>> _taskMap = {
    Matrix.urgentImportant : List.empty(),
    Matrix.notUrgentImportant : List.generate(10, (int index) => Task(isChecked: false, title: index.toString())),
    Matrix.urgentNotImportant : List.empty(),
    Matrix.notUrgentNotImportant : List.generate(100, (int index) => Task(isChecked: false, title: index.toString()))
  };

  Future<void> init() async {
    final database = AppDatabase();
    await database.into(database.taskItem).insert(TaskItemCompanion.insert(isChecked: false, title: ""));
  }

  void addTask(Matrix matrix, Task task) {
    _taskMap.putIfAbsent(matrix, () => []).add(task);
    notifyListeners();
  }

  List<Task> getTaskList(Matrix matrix) {
    return _taskMap[matrix] ?? [];
  }
}
