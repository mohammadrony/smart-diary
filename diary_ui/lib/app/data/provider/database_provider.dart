import 'package:diary_ui/app/data/model/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  Future<Database> database() async {
    var joinPath = join(await getDatabasesPath(), 'diary.db');
    print('hello');
    return openDatabase(
      joinPath,
      onCreate: (db, version) {
        return db.execute(
            // ignore: lines_longer_than_80_chars
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)');
      },
      version: 1,
    );
  }

  Future<void> insertTask(Task task) async {
    var _db = await database();
    await _db.insert(
      'tasks',
      task.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Task>> getTasks() async {
    var _db = await database();
    List<Map<String, dynamic>> taskMap = await _db.query('tasks');
    return List.generate(
      taskMap.length,
      (index) => Task.fromJson(taskMap[index]),
    );
  }
}
