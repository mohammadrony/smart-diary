import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String? title;
  final String? desc;
  const TaskCardWidget({
    Key? key,
    this.title,
    this.desc,
  }) : super(key: key);

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
            title ?? '(Unnamed Task)',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF211551),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              desc ?? 'No description added.',
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
