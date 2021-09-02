import 'package:diary_ui/app/data/services/task/service.dart';
import 'package:diary_ui/app/data/services/user/service.dart';
import 'package:get/get.dart';

class StudentHomeController extends GetxController {
  var error = false;
  var tasks = [].obs;
  var isLoading = false;
  var errorMessage = '';

  @override
  Future<void> onInit() async {
    await getStudentTasks();
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
}
