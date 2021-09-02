import 'package:diary_ui/app/data/model/task.dart';
import 'package:diary_ui/app/data/model/todo.dart';
import 'package:diary_ui/app/data/services/task/service.dart';
import 'package:diary_ui/app/data/services/todo/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentTaskController extends GetxController {
  var task = Task().obs;
  var todos = [].obs;
  var error = false;
  var errorMessage = '';

  var titleFocus = FocusNode().obs;
  var descriptionFocus = FocusNode().obs;
  var todoFocus = FocusNode().obs;

  final task_title_ctrl = TextEditingController();
  final task_desc_ctrl = TextEditingController();
  final todo_text_ctrl = TextEditingController();

  @override
  void onInit() async {
    task.value.id = Get.parameters['id'] ?? '';
    titleFocus.value.requestFocus();
    if (task.value.id != '') {
      await getStudentTask(task.value.id);
      await getTodos(task.value.id);
    }
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  Future<void> getStudentTask(String id) async {
    var apiResponse = await TaskService.getStudentTask(id);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    } else {
      task.value = apiResponse.data ?? Task();
    }
    update();
  }

  Future<void> getTodos(String taskId) async {
    var apiResponse = await TodoService.getTodos(taskId);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    } else {
      todos.value = apiResponse.data ?? [];
    }
  }

  Future<void> createTask(Task task) async {
    var apiResponse = await TaskService.createStudentTask(task);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    } else {
      this.task.value.id = apiResponse.data ?? '';
    }
    update();
  }

  Future<void> updateTask(Task task) async {
    var apiResponse = await TaskService.updateStudentTask(task);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    }
  }

  Future<void> deleteTask(String id) async {
    var apiResponse = await TaskService.deleteStudentTask(id);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    }
  }

  Future<void> createTodo(Todo todo) async {
    var apiResponse = await TodoService.createTodo(todo);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    }
  }

  Future<void> updateTodo(Todo todo) async {
    var apiResponse = await TodoService.updateTodo(todo);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    }
    update();
  }

  Future<void> deleteTodo(String id) async {
    var apiResponse = await TodoService.deleteTodo(id);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    }
  }

  Future<void> deleteTodoByTask(String taskId) async {
    var apiResponse = await TodoService.deleteTodoByTask(taskId);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    }
  }

  @override
  void onClose() {}
}
