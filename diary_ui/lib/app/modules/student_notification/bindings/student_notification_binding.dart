import 'package:get/get.dart';

import '../controllers/student_notification_controller.dart';

class StudentNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentNotificationController>(
      () => StudentNotificationController(),
    );
  }
}
