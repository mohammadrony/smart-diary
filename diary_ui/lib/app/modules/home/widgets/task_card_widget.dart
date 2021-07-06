import 'package:diary_ui/app/data/model/task.dart';
import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final Task task;
  const TaskCardWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 24,
      ),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.title == ''
                ? '(Unnamed Task)'
                : task.title!.length > 50
                    ? task.title!.substring(0, 50) + '...'
                    : task.title!,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF211551),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              task.description == ''
                  ? 'No description added.'
                  : task.description!.length > 100
                      ? task.description!.substring(0, 100) + '...'
                      : task.description!,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF86829D),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
