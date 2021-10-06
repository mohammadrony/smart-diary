import 'package:diary_ui/app/data/model/course.dart';
import 'package:flutter/material.dart';

class StudentAddCourseCardWidget extends StatelessWidget {
  final Course course;
  const StudentAddCourseCardWidget({Key? key, required this.course})
      : super(key: key);

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
        color: Colors.indigo[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                course.title == null || course.title == ''
                    ? ''
                    : course.title!.length > 50
                        ? course.title!.substring(0, 50) + '...'
                        : course.title!,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF211551),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'Course Code: ' + course.courseCode!,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF211551),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
