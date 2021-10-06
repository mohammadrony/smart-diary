import 'package:get/get.dart';

import '../controllers/student_courses_controller.dart';

class StudentCoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentCoursesController>(
      () => StudentCoursesController(),
    );
  }
}
