import 'package:diary_ui/app/data/model/todo.dart';
import 'package:diary_ui/app/data/provider/database_provider.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TodoService extends GetxService {
  static Future<List<Todo>> getTodos(int taskId) async {
    return await DatabaseProvider().getTodos(taskId);
  }

  static Future<void> createTodo(Todo todo) async {
    await DatabaseProvider().createTodo(todo);
  }
}
