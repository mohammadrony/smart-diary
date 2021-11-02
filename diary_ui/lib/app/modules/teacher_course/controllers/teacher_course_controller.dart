import 'package:diary_ui/app/data/model/course.dart';
import 'package:diary_ui/app/data/services/course/service.dart';
import 'package:diary_ui/app/data/services/task/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherCourseController extends GetxController {
  var course = Course().obs;
  var tasks = [].obs;
  var isLoading = false;
  var error = false;
  var errorMessage = '';

  var titleFocus = FocusNode().obs;
  var courseCodeFocus = FocusNode().obs;
  var sessionFocus = FocusNode().obs;
  var creditFocus = FocusNode().obs;
  var deparmentFocus = FocusNode().obs;

  final course_title_ctrl = TextEditingController();
  final course_code_ctrl = TextEditingController();
  final course_session_ctrl = TextEditingController();
  final course_credit_ctrl = TextEditingController();
  final course_dept_ctrl = TextEditingController();

  @override
  void onInit() async {
    course.value.id = Get.parameters['id'] ?? '';
    await getCourseDetails();
    await getCourseTasks();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getCourseDetails() async {
    isLoading = true;
    var apiResponse = await CourseService.getCourse(course.value.id);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    } else {
      course.value = apiResponse.data ?? Course();
    }
    isLoading = false;
  }

  Future<void> getCourseTasks() async {
    isLoading = true;
    var apiResponse = await TaskService.getCourseTasks(course.value.id);
    if (apiResponse.error == true) {
      error = true;
      errorMessage = apiResponse.errorMessage;
    } else {
      tasks.value = apiResponse.data ?? [];
    }
    isLoading = false;
  }
}
