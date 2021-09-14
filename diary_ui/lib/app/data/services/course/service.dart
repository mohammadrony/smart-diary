import 'package:diary_ui/app/data/model/api_response.dart';
import 'package:diary_ui/app/data/model/course.dart';
import 'package:diary_ui/app/data/provider/course_provider.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CourseService extends GetxService {
  static Future<APIResponse<List<Course>>> getStudentCourses() async {
    return await CourseProvider.getStudentCourses();
  }

  static Future<APIResponse<List<Course>>> getTeacherCourses() async {
    return await CourseProvider.getTeacherCourses();
  }

  static Future<APIResponse<Course>> getCourse(String id) async {
    return await CourseProvider.getCourse(id);
  }

  static Future<APIResponse<String>> createStudentCourse(Course course) async {
    return await CourseProvider.createStudentCourse(course);
  }

  static Future<APIResponse<String>> createTeacherCourse(Course course) async {
    return await CourseProvider.createTeacherCourse(course);
  }

  static Future<APIResponse<bool>> updateStudentCourse(Course course) async {
    return await CourseProvider.updateCourse(course);
  }

  static Future<APIResponse<bool>> updateTeacherCourse(Course course) async {
    return await CourseProvider.updateCourse(course);
  }

  static Future<APIResponse<bool>> deleteStudentCourse(String id) async {
    return await CourseProvider.deleteCourse(id);
  }

  static Future<APIResponse<bool>> deleteTeacherCourse(String id) async {
    return await CourseProvider.deleteCourse(id);
  }
}
