import 'package:diary_ui/app/data/model/task.dart';
import 'package:diary_ui/app/data/model/todo.dart';
import 'package:diary_ui/app/data/services/task/service.dart';
import 'package:diary_ui/app/data/services/todo/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var task = Task().obs;
  var todos = [].obs;
  var error = false;
  var errorMessage = '';
  var isLoading = false;

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
      await getTask(task.value.id);
      await getTodos(task.value.id);
    }
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  Future<void> getTask(String id) async {
    isLoading = true;
    var apiResponse = await TaskService.getTask(id);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    } else {
      task.value = apiResponse.data ?? Task();
    }
    isLoading = false;
    update();
  }

  Future<void> getTodos(String taskId) async {
    isLoading = true;
    var apiResponse = await TodoService.getTodos(taskId);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    } else {
      todos.value = apiResponse.data ?? [];
    }
    isLoading = false;
  }

  Future<void> createTask(Task task) async {
    isLoading = true;
    var apiResponse = await TaskService.createTask(task);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    }
    isLoading = false;
    update();
  }

  Future<void> updateTask(Task task) async {
    isLoading = true;
    var apiResponse = await TaskService.updateTask(task);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    }
    isLoading = false;
  }

  Future<void> deleteTask(String id) async {
    isLoading = true;
    var apiResponse = await TaskService.deleteTask(id);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    }
    isLoading = false;
  }

  Future<void> createTodo(Todo todo) async {
    isLoading = true;
    var apiResponse = await TodoService.createTodo(todo);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    }
    isLoading = false;
  }

  Future<void> updateTodo(Todo todo) async {
    isLoading = true;
    var apiResponse = await TodoService.updateTodo(todo);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    }
    isLoading = false;
    update();
  }

  Future<void> deleteTodo(String id) async {
    isLoading = true;
    var apiResponse = await TodoService.deleteTodo(id);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    }
    isLoading = false;
  }

  @override
  void onClose() {}
}
