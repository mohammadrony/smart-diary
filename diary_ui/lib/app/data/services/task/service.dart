import 'package:diary_ui/app/data/model/api_response.dart';
import 'package:diary_ui/app/data/model/task.dart';
import 'package:diary_ui/app/data/provider/task_provider.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TaskService extends GetxService {
  static Future<APIResponse<List<Task>>> getStudentTasks() async {
    return await TaskProvider.getStudentTasks();
  }

  static Future<APIResponse<List<Task>>> getCourseTasks(String CourseId) async {
    return await TaskProvider.getCourseTasks(CourseId);
  }

  static Future<APIResponse<Task>> getStudentTask(String id) async {
    return await TaskProvider.getTask(id);
  }

  static Future<APIResponse<Task>> getTeacherTask(String id) async {
    return await TaskProvider.getTask(id);
  }

  static Future<APIResponse<String>> createStudentTask(Task task) async {
    return await TaskProvider.createStudentTask(task);
  }

  static Future<APIResponse<String>> createCourseTask(Task task) async {
    return await TaskProvider.createCourseTask(task);
  }

  static Future<APIResponse<bool>> updateStudentTask(Task task) async {
    return await TaskProvider.updateTask(task);
  }

  static Future<APIResponse<bool>> updateTeacherTask(Task task) async {
    return await TaskProvider.updateTask(task);
  }

  static Future<APIResponse<bool>> deleteStudentTask(String id) async {
    return await TaskProvider.deleteTask(id);
  }

  static Future<APIResponse<bool>> deleteTeacherTask(String id) async {
    return await TaskProvider.deleteTask(id);
  }
}
