import 'package:diary_ui/app/data/model/api_response.dart';
import 'package:diary_ui/app/data/model/task.dart';
import 'package:diary_ui/app/data/provider/task_provider.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TaskService extends GetxService {
  static Future<APIResponse<List<Task>>> getTasks() async {
    return await TaskProvider.getTasks();
  }

  static Future<APIResponse<Task>> getTaskById(String id) async {
    return await TaskProvider.getTaskById(id);
  }

  static Future<APIResponse<String>> createTask(Task task) async {
    return await TaskProvider.createTask(task);
  }

  static Future<APIResponse<String>> updateTask(Task task) async {
    return await TaskProvider.updateTask(task);
  }

  static Future<APIResponse<String>> deleteTask(String id) async {
    return await TaskProvider.deleteTask(id);
  }
}
