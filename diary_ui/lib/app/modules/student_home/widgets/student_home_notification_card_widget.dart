import 'package:diary_ui/app/data/model/todo.dart';
import 'package:flutter/material.dart';

class StudentHomeNotificationCardWidget extends StatelessWidget {
  final Todo todo;
  StudentHomeNotificationCardWidget({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 20,
      ),
      margin: EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        // color: notification.CourseId == null ? Colors.white : Colors.blue[100],
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                todo.title.length > 20
                    ? todo.title.substring(0, 20) + '...'
                    : todo.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF211551),
                ),
              ),
              Spacer(),
              Text(
                todo.dueDate,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF211551),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              todo.description.isNotEmpty
                  ? todo.description.length > 50
                      ? todo.description.substring(0, 50) + '...'
                      : todo.description
                  : 'No description added.',
              style: TextStyle(
                fontSize: 14,
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
