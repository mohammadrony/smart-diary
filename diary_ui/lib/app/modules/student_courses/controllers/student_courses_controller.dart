import 'package:diary_ui/app/data/services/course/service.dart';
import 'package:get/get.dart';

class StudentCoursesController extends GetxController {
  var error = false;
  var courses = [].obs;
  var isLoading = false;
  var errorMessage = '';

  final count = 0.obs;
  @override
  void onInit() async {
    await getStudentCourses();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getStudentCourses() async {
    isLoading = true;
    var apiResponse = await CourseService.getStudentCourses();
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    } else {
      courses.value = apiResponse.data ?? [];
    }
    isLoading = false;
  }

  @override
  void onClose() {}
}
