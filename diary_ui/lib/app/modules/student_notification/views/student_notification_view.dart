import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
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
        title: Text('Your Todos'),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: 16,
          left: 32,
          right: 32,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24, top: 12),
              child: Obx(
                () => CustomRadioButton(
                  elevation: 0,
                  absoluteZeroSpacing: true,
                  unSelectedColor: Theme.of(context).canvasColor,
                  buttonLables: [
                    'Upcoming Todos (${controller.upcomingTodos.length})',
                    'Due Todos (${controller.dueTodos.length})',
                  ],
                  buttonValues: [
                    'UPCOMING',
                    'DUE',
                  ],
                  buttonTextStyle: ButtonTextStyle(
                    selectedColor: Colors.white,
                    unSelectedColor: Colors.black,
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  defaultSelected: 'UPCOMING',
                  radioButtonValue: (value) async {
                    if (value == 'UPCOMING') {
                      controller.selectedType = 'UPCOMING';
                      controller.todos.value = [];
                      controller.todos.value =
                          List.from(controller.upcomingTodos);
                    } else if (value == 'DUE') {
                      controller.selectedType = 'DUE';
                      controller.todos.value = [];
                      controller.todos.value = List.from(controller.dueTodos);
                    }
                  },
                  selectedColor: Theme.of(context).accentColor,
                  width: (Get.width - 48) / 2,
                  enableShape: true,
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => controller.todos.isEmpty
                    ? controller.selectedType == 'UPCOMING'
                        ? Text(
                            'No new todo.',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        : Text(
                            'No due todo.',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                    : Obx(
                        () => ListView.builder(
                            itemCount: controller.todos.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  await Get.toNamed(Routes.STUDENT_TASK +
                                      '?id=' +
                                      controller.todos[index].TaskId);
                                },
                                child: StudentNotificationCardWidget(
                                    todo: controller.todos[index]),
                              );
                            }),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
