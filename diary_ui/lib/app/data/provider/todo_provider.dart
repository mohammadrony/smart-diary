import 'dart:convert';

import 'package:diary_ui/app/data/model/api_response.dart';
import 'package:diary_ui/app/data/model/todo.dart';
import 'package:diary_ui/app/data/provider/database_provider.dart';
import 'package:http/http.dart' as http;

class TodoProvider {
  static Future<APIResponse<List<Todo>>> getTodos(String taskId) async {
    return http
        .get(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/todo/' + taskId),
      headers: DatabaseProvider.getHeaders(),
    )
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        Map<String, dynamic> mappedData = jsonData;
        List<dynamic> listedData = mappedData['todos'];
        // List<dynamic> == List<Map<String, dynamic>>
        final todos = List.generate(
          listedData.length,
          (index) => Todo.fromJsonMongo(listedData[index]),
        );
        return APIResponse<List<Todo>>(data: todos);
      } else {
        return APIResponse<List<Todo>>(
          error: true,
          errorMessage: 'An error occured',
        );
      }
    }).catchError((_) => APIResponse<List<Todo>>(
            error: true, errorMessage: 'An error occured'));
  }

  static Future<APIResponse<List<Todo>>> getUpcomingTodos(
      int upcomingTodoLimit, String today, String fewDaysFromNow) async {
    return http
        .get(
      Uri.parse(DatabaseProvider.BASE_URL +
          '/api/todo/upcoming?limit=' +
          upcomingTodoLimit.toString() +
          '&today=' +
          today +
          '&endDay=' +
          fewDaysFromNow),
      headers: DatabaseProvider.getHeaders(),
    )
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        Map<String, dynamic> mappedData = jsonData;
        List<dynamic> listedData = mappedData['todos'];
        // List<dynamic> == List<Map<String, dynamic>>
        final todos = List.generate(
          listedData.length,
          (index) => Todo.fromJsonMongo(listedData[index]),
        );
        return APIResponse<List<Todo>>(data: todos);
      } else {
        return APIResponse<List<Todo>>(
          error: true,
          errorMessage: 'An error occured',
        );
      }
    }).catchError((_) => APIResponse<List<Todo>>(
            error: true, errorMessage: 'An error occured'));
  }

  static Future<APIResponse<List<Todo>>> getDueTodos(
      int upcomingTodoLimit, String today, String fewDaysBack) async {
    return http
        .get(
      Uri.parse(DatabaseProvider.BASE_URL +
          '/api/todo/due?limit=' +
          upcomingTodoLimit.toString() +
          '&today=' +
          today +
          '&startDay=' +
          fewDaysBack),
      headers: DatabaseProvider.getHeaders(),
    )
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        Map<String, dynamic> mappedData = jsonData;
        List<dynamic> listedData = mappedData['todos'];
        // List<dynamic> == List<Map<String, dynamic>>
        final todos = List.generate(
          listedData.length,
          (index) => Todo.fromJsonMongo(listedData[index]),
        );
        return APIResponse<List<Todo>>(data: todos);
      } else {
        return APIResponse<List<Todo>>(
          error: true,
          errorMessage: 'An error occured',
        );
      }
    }).catchError((_) => APIResponse<List<Todo>>(
            error: true, errorMessage: 'An error occured'));
  }

  static Future<APIResponse<bool>> createTodo(Todo todo) async {
    return http
        .post(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/todo/'),
      body: json.encode(todo.toJsonExceptId()),
      headers: DatabaseProvider.getHeaders(),
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

  static Future<APIResponse<bool>> updateTodo(Todo todo) async {
    return http
        .put(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/todo/' + todo.id),
      body: json.encode(todo.toJson()),
      headers: DatabaseProvider.getHeaders(),
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

  static Future<APIResponse<bool>> deleteTodo(String id) async {
    return http
        .delete(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/todo/' + id),
      headers: DatabaseProvider.getHeaders(),
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

  static Future<APIResponse<bool>> deleteTodoByTask(String taskId) async {
    return http
        .delete(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/todo/task/' + taskId),
      headers: DatabaseProvider.getHeaders(),
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
