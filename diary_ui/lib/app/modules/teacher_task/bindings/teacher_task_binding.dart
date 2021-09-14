import 'package:get/get.dart';

import '../controllers/teacher_task_controller.dart';

class TeacherTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherTaskController>(
      () => TeacherTaskController(),
    );
  }
}
