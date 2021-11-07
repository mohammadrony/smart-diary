import 'package:diary_ui/app/modules/student_notification/widgets/student_notification_card_widget.dart';
import 'package:diary_ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/student_notification_controller.dart';

class StudentNotificationView extends GetView<StudentNotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: 16,
          left: 32,
          right: 32,
        ),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  '--- Upcoming Tasks ---',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    // return Text('hello world');
                    return GestureDetector(
                      onTap: () async {
                        print('hello student');
                        // await Get.toNamed(Routes.STUDENT_TASK +
                        //     '?id=' +
                        //     controller.notifications[index].id);
                        // await controller.getStudentNotifications();
                      },
                      child: StudentNotificationCardWidget(
                          // task: controller.notifications[index]
                          ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
