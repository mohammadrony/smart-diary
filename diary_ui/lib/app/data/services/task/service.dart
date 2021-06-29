import 'package:diary_ui/app/data/model/task.dart';
import 'package:diary_ui/app/data/provider/database_provider.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TaskService extends GetxService {
  static Future<List<Task>?> getTasks() async {
    return await DatabaseProvider().getTasks();
  }

  static Future<void> createTask(Task task) async {
    await DatabaseProvider().createTask(task);
  }
}