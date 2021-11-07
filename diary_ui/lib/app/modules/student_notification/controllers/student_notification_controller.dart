import 'package:get/get.dart';

class StudentNotificationController extends GetxController {
  var isLoading = false;
  var notifications = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getStudentNotifications() async {
    isLoading = true;
    isLoading = false;
  }

  @override
  void onClose() {}
}
