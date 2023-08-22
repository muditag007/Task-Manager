// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_manage/constants.dart';
import 'package:task_manage/task_page.dart';

class TaskTile extends StatefulWidget {
  final String title;
  final String id;
  final String email;
  const TaskTile({super.key, required this.title, required this.id, required this.email});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskPage(
                id: widget.id,
                email: widget.email,
              ),
            ),
          );
        },
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            color: korange,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Text(
              widget.title,
              maxLines: 2,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
