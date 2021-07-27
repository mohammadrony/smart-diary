import 'package:diary_ui/app/data/model/api_response.dart';
import 'package:diary_ui/app/data/model/todo.dart';
import 'package:diary_ui/app/data/provider/todo_provider.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TodoService extends GetxService {
  static Future<APIResponse<List<Todo>>> getTodos(String taskId) async {
    return await TodoProvider.getTodos(taskId);
  }

  static Future<APIResponse<String>> createTodo(Todo todo) async {
    return await TodoProvider.createTodo(todo);
  }

  static Future<APIResponse<String>> updateTodo(Todo todo) async {
    return await TodoProvider.updateTodo(todo);
  }

  static Future<APIResponse<String>> deleteTodo(String id) async {
    return await TodoProvider.deleteTodo(id);
  }
}
