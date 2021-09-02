import 'package:get/get.dart';

import '../controllers/student_task_controller.dart';

class StudentTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentTaskController>(
      () => StudentTaskController(),
    );
  }
}
