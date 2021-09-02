// import 'package:date_format/date_format.dart';
import 'package:diary_ui/app/modules/student_task/controllers/student_task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TodoWidget extends GetView<StudentTaskController> {
  TodoWidget({Key? key, this.index = 0}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final descriptionController = TextEditingController();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            margin: EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: controller.todos[index].isDone == 1
                  ? Color(0xFF7349FE)
                  : Colors.transparent,
              border: controller.todos[index].isDone == 1
                  ? null
                  : Border.all(
                      color: Color(0xFF86829D),
                      width: 1.5,
                    ),
            ),
            child: Image(
              image: AssetImage('assets/images/check_icon.png'),
            ),
          ),
          Flexible(
            child: ExpansionTile(
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      controller.todos[index].title,
                      style: TextStyle(
                        color: controller.todos[index].isDone == 1
                            ? Color(0xFF86829D)
                            : Color(0xFF211551),
                        fontSize: 16.0,
                        fontWeight: controller.todos[index].isDone == 1
                            ? FontWeight.w500
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Spacer(),
                  GetBuilder<StudentTaskController>(builder: (_) {
                    return TextButton(
                      onPressed: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1990),
                            lastDate: DateTime(2100));
                        if (date.toString().length >= 10) {
                          // formatDate(date, [dd, '/', mm, '/', yyyy]);
                          controller.todos[index].dueDate =
                              date.toString().substring(0, 10);
                          await controller.updateTodo(controller.todos[index]);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white70),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(controller.todos[index].dueDate),
                      ),
                    );
                  }),
                ],
              ),
              children: [
                GetBuilder<StudentTaskController>(builder: (_) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: TextField(
                        minLines: 1,
                        maxLines: 10,
                        controller: descriptionController
                          ..text = controller.todos[index].description,
                        decoration: InputDecoration(
                          hintText: 'Add a description',
                        ),
                      ),
                    ),
                  );
                }),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: TextButton(
                        onPressed: () async {
                          controller.todos[index].description =
                              descriptionController.text;
                          await controller.updateTodo(controller.todos[index]);
                          controller.todoFocus.value.requestFocus();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueAccent,
                          ),
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
