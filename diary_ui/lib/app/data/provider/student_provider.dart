import 'dart:convert';

import 'package:diary_ui/app/data/model/api_response.dart';
import 'package:diary_ui/app/data/model/student.dart';
import 'package:diary_ui/app/data/model/user_response.dart';
import 'package:diary_ui/app/data/provider/database_provider.dart';
import 'package:http/http.dart' as http;

class StudentProvider {
  static Future<APIResponse<UserResponse>> loginStudent(Student student) async {
    return http
        .post(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/student/login'),
      headers: DatabaseProvider.getHeaders(),
    )
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        Map<String, dynamic> userResponseMap = jsonData;
        final userResponse = UserResponse.fromJson(userResponseMap['data']);
        print(userResponse);
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

  static Future<APIResponse<UserResponse>> registerStudent(
      Student student) async {
    return http
        .post(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/student/register'),
      body: json.encode(student.toJsonExceptId()),
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

  static Future<APIResponse<bool>> updateStudent(Student student) async {
    return http
        .put(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/student/' + student.id),
      body: json.encode(student.toJson()),
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

  static Future<APIResponse<bool>> deleteStudent(String id) async {
    return http
        .delete(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/student/' + id),
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
