import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            margin: EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Color(0xFF7349FE),
            ),
            child: Image(
              image: AssetImage('assets/images/check_icon.png'),
            ),
          ),
          Text(
            'todo widget',
            style: TextStyle(
              color: Color(0xFF211551),
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
