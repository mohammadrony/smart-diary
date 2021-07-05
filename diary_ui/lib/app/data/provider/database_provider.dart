import 'package:diary_ui/app/data/model/task.dart';
import 'package:diary_ui/app/data/model/todo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'diary.db'),
      onCreate: (db, version) async {
        await db.execute(
            // ignore: lines_longer_than_80_chars
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)');
        await db.execute(
            // ignore: lines_longer_than_80_chars
            'CREATE TABLE todos(id INTEGER PRIMARY KEY, title TEXT, isDone INTEGER, TaskId INTEGER)');
        return;
      },
      version: 1,
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

  Future<Task> getTaskById(int id) async {
    var _db = await database();
    var taskMap = await _db.query('tasks', where: 'id = $id');
    var tasks =
        List.generate(taskMap.length, (index) => Task.fromJson(taskMap[index]));
    return tasks[0];
  }

  Future<int> createTask(Task task) async {
    var id = 0;
    var _db = await database();
    await _db
        .insert(
          'tasks',
          task.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        )
        .then((value) => {id = value});
    return id;
  }

  Future<List<Todo>> getTodos(int taskId) async {
    var _db = await database();
    List<Map<String, dynamic>> todoMap = await _db.query(
      'todos',
      where: 'TaskId = $taskId',
    );
    var todos = List.generate(
      todoMap.length,
      (index) => Todo.fromJson(todoMap[index]),
    );
    return todos;
  }

  Future<void> createTodo(Todo todo) async {
    var _db = await database();
    await _db.insert(
      'todos',
      todo.toJson(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }
}
