import 'package:diary_ui/app/data/model/task.dart';
import 'package:diary_ui/app/data/model/todo.dart';
import 'package:diary_ui/app/modules/task/widgets/todo_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Get.delete<TaskController>();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 6.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => {
                              Get.back(),
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Image(
                                image: AssetImage(
                                  'assets/images/back_arrow_icon.png',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Obx(
                              () => TextField(
                                focusNode: controller.titleFocus.value,
                                controller: controller.task_title_ctrl
                                  ..text = controller.task.value.title ?? '',
                                onSubmitted: (value) async {
                                  if (value.trim().isNotEmpty) {
                                    if (controller.task.value.id == 0) {
                                      controller.task.value.title =
                                          value.trim();
                                      var newTask =
                                          Task(title: value, description: '');
                                      await controller.createTask(newTask);
                                    } else {
                                      controller.task.value.title = value;
                                      await controller
                                          .updateTask(controller.task.value);
                                    }
                                    controller.descriptionFocus.value
                                        .requestFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'Enter task title...',
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF211551),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GetBuilder<TaskController>(
                      builder: (_) {
                        return _.task.value.id == 0
                            ? SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: TextField(
                                  focusNode: controller.descriptionFocus.value,
                                  controller: controller.task_desc_ctrl
                                    ..text =
                                        controller.task.value.description ?? '',
                                  onSubmitted: (value) async {
                                    if (controller.task.value.id != 0) {
                                      controller.task.value.description =
                                          value.trim();
                                      await controller
                                          .updateTask(controller.task.value);
                                      controller.todoFocus.value.requestFocus();
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText:
                                        'Enter description for the task...',
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 24.0),
                                  ),
                                ),
                              );
                      },
                    ),
                    Obx(() => Expanded(
                          child: ListView.builder(
                            itemCount: controller.todos.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  controller.todos[index].isDone =
                                      controller.todos[index].isDone == 1
                                          ? 0
                                          : 1;
                                  await controller
                                      .updateTodo(controller.todos[index]);
                                },
                                child: GetBuilder<TaskController>(
                                  builder: (_) {
                                    return TodoWidget(
                                      title: controller.todos[index].title,
                                      isDone:
                                          controller.todos[index].isDone == 0
                                              ? false
                                              : true,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        )),
                    GetBuilder<TaskController>(
                      builder: (_) {
                        return _.task.value.id == 0
                            ? SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      margin: EdgeInsets.only(right: 16.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        color: Colors.transparent,
                                        border: Border.all(
                                          color: Color(0xFF86829D),
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/check_icon.png'),
                                      ),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        controller: controller.todo_text_ctrl,
                                        focusNode: controller.todoFocus.value,
                                        onSubmitted: (value) async {
                                          if (value.trim().isNotEmpty) {
                                            var newTodo = Todo(
                                              title: value.trim(),
                                              isDone: 0,
                                              TaskId: controller.task.value.id,
                                            );
                                            await controller
                                                .createTodo(newTodo);
                                            await controller.getTodos(
                                                controller.task.value.id ?? 0);
                                            controller.todo_text_ctrl.text = '';
                                            controller.todoFocus.value
                                                .requestFocus();
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Enter Todo item...',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                      },
                    ),
                  ],
                ),
                GetBuilder<TaskController>(
                  builder: (_) {
                    return _.task.value.id == 0
                        ? SizedBox.shrink()
                        : Positioned(
                            bottom: 24,
                            right: 24,
                            child: GestureDetector(
                              onTap: () async {
                                if (controller.task.value.id != 0) {
                                  await controller.deleteTask(
                                      controller.task.value.id ?? 0);
                                  Get.back();
                                }
                              },
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFE3577),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/delete_icon.png'),
                                ),
                              ),
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
