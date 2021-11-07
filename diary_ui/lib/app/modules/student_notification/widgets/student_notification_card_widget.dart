import 'package:flutter/material.dart';

class StudentNotificationCardWidget extends StatelessWidget {
  // final Notification notification;
  const StudentNotificationCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 24,
      ),
      margin: EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        // color: notification.CourseId == null ? Colors.white : Colors.blue[100],
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'hello world',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF211551),
                ),
              ),
              Spacer(),
              Text(
                '03-12-2021',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF211551),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'asdfklasdj aflsdfjlaksdf asdf ladsfjklasdf k',
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
