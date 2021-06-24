import 'package:get/get.dart';
import '../todo_model.dart';

class HomeController extends GetxController {
  var todo = List<Todo>.filled(1, Todo()).obs;

  final count = 0.obs;
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
