import 'dart:convert';

import 'package:diary_ui/app/data/model/api_response.dart';
import 'package:diary_ui/app/data/model/todo.dart';
import 'package:diary_ui/app/data/provider/database_provider.dart';
import 'package:http/http.dart' as http;

class TodoProvider {
  static Future<APIResponse<List<Todo>>> getTodos(String taskId) async {
    return http.get(Uri.parse(DatabaseProvider.BASE_URL + '/api/todo')).then(
        (data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        List<Map<String, dynamic>> todoMap = jsonData;
        final todos = List.generate(
          todoMap.length,
          (index) => Todo.fromJson(todoMap[index]),
        );
        return APIResponse<List<Todo>>(data: todos);
      } else {
        return APIResponse<List<Todo>>(
          error: true,
          errorMessage: 'An error occured',
        );
      }
    }).catchError((_) =>
        APIResponse<List<Todo>>(error: true, errorMessage: 'An error occured'));
  }

  static Future<APIResponse<String>> createTodo(Todo todo) async {
    // TODO: Impliment createTodo method
    // ignore: await_only_futures
    return await APIResponse<String>(data: 'create todo method called');
  }

  static Future<APIResponse<String>> updateTodo(Todo todo) async {
    // TODO: Impliment updateTodo method
    // ignore: await_only_futures
    return await APIResponse<String>(data: 'update todo method called');
  }

  static Future<APIResponse<String>> deleteTodo(String id) async {
    // TODO: Impliment deleteTodo method
    // ignore: await_only_futures
    return await APIResponse<String>(data: 'delete todo method called');
  }
}
