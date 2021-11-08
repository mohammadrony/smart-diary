import 'package:diary_ui/app/modules/student_home/controllers/student_home_controller.dart';
import 'package:diary_ui/app/modules/student_home/widgets/student_task_card_widget.dart';
import 'package:diary_ui/app/routes/app_pages.dart';
import 'package:diary_ui/app/widgets/no_glow_behavior.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TaskListView extends GetView<StudentHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/logo.png'),
                        ),
                        SizedBox(width: 32),
                        Text(
                          'Your Tasks',
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
                Expanded(
                  child: ScrollConfiguration(
                    behavior: NoGlowBehavior(),
                    child: Obx(() => ListView.builder(
                        itemCount: controller.tasks.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              await Get.toNamed(Routes.STUDENT_TASK +
                                  '?id=' +
                                  controller.tasks[index].id);
                              await controller.getStudentTasks();
                              await controller.getUpcomingTodos();
                            },
                            child: StudentTaskCardWidget(
                                task: controller.tasks[index]),
                          );
                        })),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
