import 'package:diary_ui/app/data/services/course/service.dart';
import 'package:get/get.dart';

class StudentCourseAddController extends GetxController {
  var error = false;
  var departmentCourses = [].obs;
  var studentCourses = [].obs;
  var isLoading = false;
  var errorMessage = '';

  final count = 0.obs;
  @override
  void onInit() async {
    await getDepartmentCourses();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getDepartmentCourses() async {
    isLoading = true;
    var apiResponse = await CourseService.getDepartmentCourses();
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    } else {
      departmentCourses.value = apiResponse.data ?? [];
    }
    isLoading = false;
  }

  Future<void> getStudentCourses() async {
    isLoading = true;
    var apiResponse = await CourseService.getStudentCourses();
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    } else {
      studentCourses.value = apiResponse.data ?? [];
    }
    isLoading = false;
  }

  @override
  void onClose() {}
}
