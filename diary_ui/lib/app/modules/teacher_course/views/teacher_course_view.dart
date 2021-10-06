import 'package:diary_ui/app/modules/teacher_course/widgets/teacher_task_card_widget.dart';
import 'package:diary_ui/app/routes/app_pages.dart';
import 'package:diary_ui/app/widgets/no_glow_behavior.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/teacher_course_controller.dart';

class TeacherCourseView extends GetView<TeacherCourseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diary'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        color: Color(0xFFF6F6F6),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 32, top: 32),
                  child: Obx(
                    () => Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/logo.png'),
                        ),
                        SizedBox(width: 32),
                        controller.course.value.id == ''
                            ? Text(
                                'New Course',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF211551),
                                ),
                              )
                            : Text(
                                controller.course.value.title ?? '',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF211551),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => controller.course.value.id == ''
                      ? Container(
                          child: TextField(
                            focusNode: controller.titleFocus.value,
                            controller: controller.course_title_ctrl
                              ..text = controller.course.value.title ?? '',
                            onSubmitted: (value) async {
                              if (value.trim().isNotEmpty) {
                                controller.courseCodeFocus.value.requestFocus();
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter course title...',
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF211551),
                            ),
                          ),
                        )
                      : Obx(
                          () => Expanded(
                            child: controller.tasks.isEmpty
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 24.0),
                                    child: Text(
                                      'No Task Added',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  )
                                : ScrollConfiguration(
                                    behavior: NoGlowBehavior(),
                                    child: Obx(() => ListView.builder(
                                        itemCount: controller.tasks.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () async {
                                              await Get.toNamed(Routes
                                                      .TEACHER_TASK +
                                                  '?id=' +
                                                  controller.tasks[index].id +
                                                  '&courseId=' +
                                                  controller.course.value.id);
                                              await controller.getCourseTasks();
                                            },
                                            child: TeacherTaskCardWidget(
                                                task: controller.tasks[index]),
                                          );
                                        })),
                                  ),
                          ),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add Task'),
        onPressed: () async {
          await Get.toNamed(
              Routes.TEACHER_TASK + '?courseId=' + controller.course.value.id);
          await controller.getCourseTasks();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        icon: Icon(Icons.add),
      ),
    );
  }
}
