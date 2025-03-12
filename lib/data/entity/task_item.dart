import 'package:drift/drift.dart';

class TaskItem extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get isChecked => boolean()();
  TextColumn get title => text()();
}