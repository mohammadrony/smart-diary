import 'dart:convert';

import 'package:diary_ui/app/data/model/api_response.dart';
import 'package:diary_ui/app/data/model/task.dart';
import 'package:diary_ui/app/data/provider/database_provider.dart';
import 'package:http/http.dart' as http;

class TaskProvider {
  static Future<APIResponse<List<Task>>> getTasks() async {
    return http.get(Uri.parse(DatabaseProvider.BASE_URL + '/api/todo')).then(
        (data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        List<Map<String, dynamic>> taskMap = jsonData;
        final tasks = List.generate(
          taskMap.length,
          (index) => Task.fromJson(taskMap[index]),
        );
        return APIResponse<List<Task>>(data: tasks);
      } else {
        return APIResponse<List<Task>>(
          error: true,
          errorMessage: 'An error occured',
        );
      }
    }).catchError((_) =>
        APIResponse<List<Task>>(error: true, errorMessage: 'An error occured'));
  }

  static Future<APIResponse<Task>> getTaskById(String id) async {
    return http
        .get(Uri.parse(DatabaseProvider.BASE_URL + '/api/todo/' + id))
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        Map<String, dynamic> taskMap = jsonData;
        final task = Task.fromJson(taskMap);
        return APIResponse<Task>(data: task);
      } else {
        return APIResponse<Task>(
          error: true,
          errorMessage: 'An error occured',
        );
      }
    }).catchError((_) =>
            APIResponse<Task>(error: true, errorMessage: 'An error occured'));
  }

  static Future<APIResponse<String>> createTask(Task task) async {
    // TODO: Impliment createTask method
    // ignore: await_only_futures
    return await APIResponse<String>(data: 'create task method called');
  }

  static Future<APIResponse<String>> updateTask(Task task) async {
    // TODO: Impliment updateTask method
    // ignore: await_only_futures
    return await APIResponse<String>(data: 'update task method called');
  }

  static Future<APIResponse<String>> deleteTask(String id) async {
    // TODO: Impliment deleteTask method
    // ignore: await_only_futures
    return await APIResponse<String>(data: 'delete task method called');
  }
}
