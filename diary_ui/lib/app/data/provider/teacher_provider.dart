import 'dart:convert';

import 'package:diary_ui/app/data/model/api_response.dart';
import 'package:diary_ui/app/data/model/teacher.dart';
import 'package:diary_ui/app/data/model/user_response.dart';
import 'package:diary_ui/app/data/provider/database_provider.dart';
import 'package:http/http.dart' as http;

class TeacherProvider {
  static Future<APIResponse<UserResponse>> loginTeacher(Teacher teacher) async {
    return http
        .post(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/teacher/login'),
      body: json.encode(teacher.toJsonExceptId()),
      headers: DatabaseProvider.getHeaders(),
    )
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        Map<String, dynamic> userResponseMap = jsonData;
        final userResponse = UserResponse.fromJson(userResponseMap['data']);
        return APIResponse<UserResponse>(data: userResponse);
      } else {
        return APIResponse<UserResponse>(
          error: true,
          errorMessage: 'An error occured',
        );
      }
    }).catchError((_) => APIResponse<UserResponse>(
            error: true, errorMessage: 'An error occured'));
  }

  static Future<APIResponse<UserResponse>> registerTeacher(
      Teacher teacher) async {
    return http
        .post(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/teacher/register'),
      body: json.encode(teacher.toJsonExceptId()),
      headers: DatabaseProvider.getHeaders(),
    )
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        Map<String, dynamic> userResponseMap = jsonData;
        final userResponse = UserResponse.fromJson(userResponseMap['data']);
        return APIResponse<UserResponse>(data: userResponse);
      } else {
        return APIResponse<UserResponse>(
          error: true,
          errorMessage: 'An error occured',
        );
      }
    }).catchError((_) => APIResponse<UserResponse>(
            error: true, errorMessage: 'An error occured'));
  }

  static Future<APIResponse<bool>> updateTeacher(Teacher teacher) async {
    return http
        .put(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/teacher/' + teacher.id),
      body: json.encode(teacher.toJson()),
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

  static Future<APIResponse<bool>> deleteTeacher(String id) async {
    return http
        .delete(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/teacher/' + id),
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
