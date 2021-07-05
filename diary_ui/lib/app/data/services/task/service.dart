import 'package:diary_ui/app/data/model/task.dart';
import 'package:diary_ui/app/data/provider/database_provider.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TaskService extends GetxService {
  static Future<List<Task>> getTasks() async {
    return await DatabaseProvider().getTasks();
  }

  static Future<Task> getTaskById(int id) async {
    return await DatabaseProvider().getTaskById(id);
  }

  static Future<int> createTask(Task task) async {
    return await DatabaseProvider().createTask(task);
  }

  static Future<void> updateTask(Task task) async {
    return await DatabaseProvider().updateTask(task);
  }

  static Future<void> deleteTask(int id) async {
    return await DatabaseProvider().deleteTask(id);
  }
}
