import 'dart:convert';

import 'package:diary_ui/app/data/model/api_response.dart';
import 'package:diary_ui/app/data/model/course.dart';
import 'package:diary_ui/app/data/provider/database_provider.dart';
import 'package:http/http.dart' as http;

class CourseProvider {
  static Future<APIResponse<List<Course>>> getStudentCourses() async {
    return http
        .get(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/course/student'),
      headers: DatabaseProvider.getHeaders(),
    )
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        Map<String, dynamic> mappedData = jsonData;
        List<dynamic> listedData = mappedData['data'];
        final courses = List.generate(
          listedData.length,
          (index) => Course.fromJsonMongo(listedData[index]),
        );
        return APIResponse<List<Course>>(data: courses);
      } else {
        return APIResponse<List<Course>>(
          error: true,
          errorMessage: 'An error occured',
        );
      }
    }).catchError((_) => APIResponse<List<Course>>(
            error: true, errorMessage: 'An error occured'));
  }

  static Future<APIResponse<List<Course>>> getTeacherCourses() async {
    return http
        .get(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/course/teacher'),
      headers: DatabaseProvider.getHeaders(),
    )
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        Map<String, dynamic> mappedData = jsonData;
        List<dynamic> listedData = mappedData['data'];
        final courses = List.generate(
          listedData.length,
          (index) => Course.fromJsonMongo(listedData[index]),
        );
        return APIResponse<List<Course>>(data: courses);
      } else {
        return APIResponse<List<Course>>(
          error: true,
          errorMessage: 'An error occured',
        );
      }
    }).catchError((_) => APIResponse<List<Course>>(
            error: true, errorMessage: 'An error occured'));
  }

  static Future<APIResponse<List<Course>>> getDepartmentCourses() async {
    return http
        .get(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/course/department'),
      headers: DatabaseProvider.getHeaders(),
    )
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        Map<String, dynamic> mappedData = jsonData;
        List<dynamic> listedData = mappedData['data'];
        final courses = List.generate(
          listedData.length,
          (index) => Course.fromJsonMongo(listedData[index]),
        );
        return APIResponse<List<Course>>(data: courses);
      } else {
        return APIResponse<List<Course>>(
          error: true,
          errorMessage: 'An error occured',
        );
      }
    }).catchError((_) => APIResponse<List<Course>>(
            error: true, errorMessage: 'An error occured'));
  }

  static Future<APIResponse<Course>> getCourse(String id) async {
    return http
        .get(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/course/' + id),
      headers: DatabaseProvider.getHeaders(),
    )
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        Map<String, dynamic> courseMap = jsonData;
        final course = Course.fromJsonMongo(courseMap['data']);
        return APIResponse<Course>(data: course);
      } else {
        return APIResponse<Course>(
          error: true,
          errorMessage: 'An error occured',
        );
      }
    }).catchError((_) =>
            APIResponse<Course>(error: true, errorMessage: 'An error occured'));
  }

  static Future<APIResponse<String>> createStudentCourse(Course course) async {
    return http
        .post(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/course/student'),
      body: json.encode(course.toJsonExceptId()),
      headers: DatabaseProvider.getHeaders(),
    )
        .then((data) {
      if (data.statusCode == 201) {
        final jsonData = jsonDecode(data.body);
        Map<String, dynamic> courseMap = jsonData;
        final course = Course.fromJsonMongo(courseMap['data']);
        return APIResponse<String>(data: course.id);
      } else {
        return APIResponse<String>(
          error: true,
          errorMessage: 'An error occured',
        );
      }
    }).catchError((_) =>
            APIResponse<String>(error: true, errorMessage: 'An error occured'));
  }

  static Future<APIResponse<String>> createTeacherCourse(Course course) async {
    return http
        .post(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/course/teacher'),
      body: json.encode(course.toJsonExceptId()),
      headers: DatabaseProvider.getHeaders(),
    )
        .then((data) {
      if (data.statusCode == 201) {
        final jsonData = jsonDecode(data.body);
        Map<String, dynamic> courseMap = jsonData;
        final course = Course.fromJsonMongo(courseMap['data']);
        return APIResponse<String>(data: course.id);
      } else {
        return APIResponse<String>(
          error: true,
          errorMessage: 'An error occured',
        );
      }
    }).catchError((_) =>
            APIResponse<String>(error: true, errorMessage: 'An error occured'));
  }

  static Future<APIResponse<bool>> updateCourse(Course course) async {
    return http
        .put(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/course/' + course.id),
      body: json.encode(course.toJsonExceptId()),
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

  static Future<APIResponse<bool>> deleteCourse(String id) async {
    return http
        .delete(
      Uri.parse(DatabaseProvider.BASE_URL + '/api/course/' + id),
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
