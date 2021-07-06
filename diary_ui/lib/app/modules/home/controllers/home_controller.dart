import 'package:diary_ui/app/data/services/task/service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var tasks = [].obs;

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
    tasks.value = await TaskService.getTasks();
  }
}
