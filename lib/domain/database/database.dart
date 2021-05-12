import 'package:moor_flutter/moor_flutter.dart';
part 'database.g.dart';

class Foods extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get idMeal => text()();
  TextColumn get strMeal => text()();
  TextColumn get strMealThumb => text()();
}

@UseMoor(tables: [Foods])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(
    path: "db.sqlite", logStatements: true));

  int get schemaVersion => 1;
}