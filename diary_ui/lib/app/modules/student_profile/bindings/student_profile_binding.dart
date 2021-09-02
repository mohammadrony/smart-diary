import 'package:get/get.dart';

import '../controllers/student_profile_controller.dart';

class StudentProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentProfileController>(
      () => StudentProfileController(),
    );
  }
}
