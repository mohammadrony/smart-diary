import 'package:get/get.dart';

import '../controllers/student_course_add_controller.dart';

class StudentCourseAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentCourseAddController>(
      () => StudentCourseAddController(),
    );
  }
}
