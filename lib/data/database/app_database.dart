import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../entity/task_item.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [TaskItem])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> addTask(TaskItemCompanion task) {
    return into(taskItem).insert(task);
  }

  Future<List<TaskItem>> get allTaskItemList =>
      select(taskItem).get().then((onValue) => List.empty()); // fixme jhs ㅇㅣ게 맞는지
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
