import 'package:diary_ui/app/modules/student_course_add/widgets/student_add_course_card_widget.dart';
import 'package:diary_ui/app/widgets/no_glow_behavior.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/student_course_add_controller.dart';

class StudentCourseAddView extends GetView<StudentCourseAddController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diary'),
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
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/logo.png'),
                        ),
                        SizedBox(width: 32),
                        Text(
                          'Available Courses',
                          style: TextStyle(
                            fontSize: 20,
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
                        itemCount: controller.departmentCourses.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: StudentAddCourseCardWidget(
                                course: controller.departmentCourses[index]),
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
