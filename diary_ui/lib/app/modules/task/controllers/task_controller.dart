import 'package:diary_ui/app/data/model/task.dart';
import 'package:diary_ui/app/data/model/todo.dart';
import 'package:diary_ui/app/data/services/task/service.dart';
import 'package:diary_ui/app/data/services/todo/service.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var id;
  var task = Task().obs;
  var todos = [].obs;
  @override
  void onInit() async {
    id = int.parse(Get.parameters['id'] ?? '0');
    if (id != 0) {
      await getTaskById(id);
      await getTodos(id);
    }
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  Future<void> getTaskById(int id) async {
    task.value = await TaskService.getTaskById(id);
  }

  Future<void> getTodos(int id) async {
    todos.value = await TodoService.getTodos(id);
  }

  Future<void> createTask(Task task) async {
    await TaskService.createTask(task);
  }

  Future<void> createTodo(Todo todo) async {
    await TodoService.createTodo(todo);
  }

  @override
  void onClose() {}
}
