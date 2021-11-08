import 'package:diary_ui/app/data/services/task/service.dart';
import 'package:diary_ui/app/data/services/todo/service.dart';
import 'package:diary_ui/app/data/services/user/service.dart';
import 'package:diary_ui/app/routes/app_pages.dart';
import 'package:get/get.dart';

class StudentHomeController extends GetxController {
  var error = false;
  var tasks = [].obs;
  var isLoading = false;
  var errorMessage = '';
  var upcomingTodos = [].obs;
  var upcomingTodoLimit = 7;

  @override
  Future<void> onInit() async {
    await getStudentTasks();
    await getUpcomingTodos();
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getStudentTasks() async {
    isLoading = true;
    var apiResponse = await TaskService.getStudentTasks();
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    } else {
      tasks.value = apiResponse.data ?? [];
    }
    isLoading = false;
  }

  Future<void> getUpcomingTodos() async {
    isLoading = true;
    var now = DateTime.now();
    var today = now.toString().substring(0, 10);
    var threeDaysFromNow =
        now.add(const Duration(days: 3)).toString().substring(0, 10);
    var apiResponse = await TodoService.getUpcomingTodos(
        upcomingTodoLimit, today, threeDaysFromNow);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    } else {
      upcomingTodos.value = apiResponse.data ?? [];
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
