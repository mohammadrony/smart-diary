import 'package:get/get.dart';

import 'package:diary_ui/app/modules/home/bindings/home_binding.dart';
import 'package:diary_ui/app/modules/home/views/home_view.dart';
import 'package:diary_ui/app/modules/task/bindings/task_binding.dart';
import 'package:diary_ui/app/modules/task/views/task_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TASK,
      page: () => TaskView(),
      binding: TaskBinding(),
    ),
  ];
}
