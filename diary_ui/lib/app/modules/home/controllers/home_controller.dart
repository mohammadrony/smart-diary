import 'package:diary_ui/app/data/services/task/service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var error = false;
  var tasks = [].obs;
  var isLoading = false;
  var errorMessage = '';

  @override
  Future<void> onInit() async {
    await getTasks();
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getTasks() async {
    isLoading = true;
    var apiResponse = await TaskService.getTasks();
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    } else {
      tasks.value = apiResponse.data ?? [];
    }
    isLoading = false;
  }
}
