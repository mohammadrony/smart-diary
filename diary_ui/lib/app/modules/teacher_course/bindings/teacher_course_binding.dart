import 'package:get/get.dart';

import '../controllers/teacher_course_controller.dart';

class TeacherCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherCourseController>(
      () => TeacherCourseController(),
    );
  }
}
