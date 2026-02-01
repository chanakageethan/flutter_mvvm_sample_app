import 'package:flutter/material.dart';

import '../../../data/services/api/models/todo.dart';

class TodoListItem extends StatelessWidget {
  final Todo todoItem;

  const TodoListItem({super.key, required this.todoItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              todoItem.title.toString(),
              maxLines: 2,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),

          SizedBox(width: 4),

          (todoItem?.completed == true)
              ? Icon(Icons.check_circle, color: Colors.green, size: 36.0)
              : Icon(
                  Icons.check_circle_outlined,
                  color: Colors.black12,
                  size: 36.0,
                ),
        ],
      ),
    );
  }
}
