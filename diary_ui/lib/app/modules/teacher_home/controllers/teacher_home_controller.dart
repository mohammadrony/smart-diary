import 'package:diary_ui/app/data/model/api_response.dart';
import 'package:diary_ui/app/data/services/course/service.dart';
import 'package:diary_ui/app/data/services/user/service.dart';
import 'package:diary_ui/app/routes/app_pages.dart';
import 'package:get/get.dart';

class TeacherHomeController extends GetxController {
  var courses = [].obs;
  var isLoading = false;
  var error = false;
  var errorMessage = '';

  @override
  void onInit() {
    getTeacherCourses();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getTeacherCourses() async {
    isLoading = true;
    var apiResponse = await CourseService.getTeacherCourses();
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    } else {
      courses.value = apiResponse.data ?? [];
    }
    isLoading = false;
  }

  void signout() {
    UserService.token = '';
    UserService.userId = '';
    UserService.userType = '';
    Get.offAllNamed(Routes.LOGIN);
  }
}
