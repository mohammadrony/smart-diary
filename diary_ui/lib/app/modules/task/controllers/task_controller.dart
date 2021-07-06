import 'package:diary_ui/app/data/model/task.dart';
import 'package:diary_ui/app/data/model/todo.dart';
import 'package:diary_ui/app/data/services/task/service.dart';
import 'package:diary_ui/app/data/services/todo/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var task = Task().obs;
  var todos = [].obs;

  var titleFocus = FocusNode().obs;
  var descriptionFocus = FocusNode().obs;
  var todoFocus = FocusNode().obs;

  final task_title_ctrl = TextEditingController();
  final task_desc_ctrl = TextEditingController();
  final todo_text_ctrl = TextEditingController();

  @override
  void onInit() async {
    task.value.id = int.parse(Get.parameters['id'] ?? '0');
    titleFocus.value.requestFocus();
    if (task.value.id != 0) {
      await getTaskById(task.value.id ?? 0);
      await getTodos(task.value.id ?? 0);
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
    update();
  }

  Future<void> getTodos(int id) async {
    todos.value = await TodoService.getTodos(id);
  }

  Future<void> createTask(Task task) async {
    this.task.value.id = await TaskService.createTask(task);
    update();
  }

  Future<void> updateTask(Task task) async {
    await TaskService.updateTask(task);
  }

  Future<void> deleteTask(int id) async {
    await TaskService.deleteTask(id);
  }

  Future<void> createTodo(Todo todo) async {
    await TodoService.createTodo(todo);
  }

  Future<void> updateTodo(Todo todo) async {
    await TodoService.updateTodo(todo);
    update();
  }

  Future<void> deleteTodo(int id) async {
    await TodoService.deleteTodo(id);
  }

  @override
  void onClose() {}
}
