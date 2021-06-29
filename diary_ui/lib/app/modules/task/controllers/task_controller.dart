import 'package:diary_ui/app/data/model/task.dart';
import 'package:diary_ui/app/data/services/task/service.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  Future<void> createTask(Task task) async {
    await TaskService.createTask(task);
  }

  @override
  void onClose() {}
}
