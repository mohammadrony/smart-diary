import 'dart:io';

import 'package:diary_ui/app/data/services/task/service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var tasks = [].obs;

  @override
  Future<void> onInit() async {
    await getTasks();
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getTasks() async {
    try {
      isLoading.value = true;
      var tasklist = await TaskService.getTasks();
      tasks.value = tasklist ?? [];
    } finally {
      isLoading.value = false;
    }
  }
}
