import 'dart:convert';

import 'package:diary_ui/app/data/model/api_response.dart';
import 'package:diary_ui/app/data/model/task.dart';
import 'package:diary_ui/app/data/provider/database_provider.dart';
import 'package:http/http.dart' as http;

class TaskProvider {
  static Future<APIResponse<List<Task>>> getTasks() async {
    return http
        .get(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/task/'),
      headers: DatabaseProvider.headers,
    )
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        Map<String, dynamic> mappedData = jsonData;
        List<dynamic> listedData = mappedData['tasks'];
        // List<dynamic> == List<Map<String, dynamic>>
        final tasks = List.generate(
          listedData.length,
          (index) => Task.fromJsonMongo(listedData[index]),
        );
        return APIResponse<List<Task>>(data: tasks);
      } else {
        return APIResponse<List<Task>>(
          error: true,
          errorMessage: 'An error occured',
        );
      }
    }).catchError((_) => APIResponse<List<Task>>(
            error: true, errorMessage: 'An error occured'));
  }

  static Future<APIResponse<Task>> getTask(String id) async {
    return http
        .get(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/task/' + id),
      headers: DatabaseProvider.headers,
    )
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        Map<String, dynamic> taskMap = jsonData;
        final task = Task.fromJsonMongo(taskMap);
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

  static Future<APIResponse<bool>> createTask(Task task) async {
    // TODO: check createTask
    return http
        .post(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/task/'),
      body: json.encode(task.toJsonExceptId()),
      headers: DatabaseProvider.headers,
    )
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      } else {
        return APIResponse<bool>(
          error: true,
          errorMessage: 'An error occured',
        );
      }
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  static Future<APIResponse<bool>> updateTask(Task task) async {
    return http
        .put(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/task/' + task.id),
      body: json.encode(task.toJson()),
      headers: DatabaseProvider.headers,
    )
        .then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      } else {
        return APIResponse<bool>(
          error: true,
          errorMessage: 'An error occured',
        );
      }
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  static Future<APIResponse<bool>> deleteTask(String id) async {
    return http
        .delete(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/task/' + id),
      headers: DatabaseProvider.headers,
    )
        .then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      } else {
        return APIResponse<bool>(
          error: true,
          errorMessage: 'An error occured',
        );
      }
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }
}
