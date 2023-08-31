import 'package:diary_ui/app/data/services/todo/service.dart';
import 'package:get/get.dart';

class StudentNotificationController extends GetxController {
  var error = false;
  var todos = [].obs;
  var selectedType = 'UPCOMING';
  var isLoading = false;
  var errorMessage = '';
  var upcomingTodos = [].obs;
  var upcomingTodoLimit = 200;
  var dueTodos = [].obs;
  var dueTodoLimit = 200;

  @override
  void onInit() async {
    await getUpcomingTodos();
    await getDueTodos();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getUpcomingTodos() async {
    isLoading = true;
    var now = DateTime.now();
    var today = now.toString().substring(0, 10);
    var fewDaysFromNow =
        now.add(const Duration(days: 30)).toString().substring(0, 10);
    var apiResponse = await TodoService.getUpcomingTodos(
        upcomingTodoLimit, today, fewDaysFromNow);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    } else {
      upcomingTodos.value = apiResponse.data ?? [];
      todos.value = List.from(upcomingTodos);
    }
    isLoading = false;
  }

  Future<void> getDueTodos() async {
    isLoading = true;
    var now = DateTime.now();
    var today = now.toString().substring(0, 10);
    var fewDaysBack = DateTime(2020).toString().substring(0, 10);
    var apiResponse =
        await TodoService.getDueTodos(dueTodoLimit, today, fewDaysBack);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    } else {
      dueTodos.value = apiResponse.data ?? [];
    }
    isLoading = false;
  }

  @override
  void onClose() {}
}
