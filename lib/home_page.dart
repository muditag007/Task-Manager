// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_manage/all_api.dart';
import 'package:task_manage/constants.dart';
import 'package:task_manage/new_task.dart';
import 'package:task_manage/task_tile.dart';

class HomePage extends StatefulWidget {
  static String id = 'homepage';
  final String email;
  const HomePage({super.key, required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map data;
  List tasks = [];

  fetch() async {
    final Map info = {
      "email": widget.email,
    };
    data = await AllApi().getData(info, '/get');
    tasks = data['tasks'].toList();
    print(tasks[0]['title']);
    setState(() {});
  }

  @override
  void initState() {
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kpurple,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: Text(
          "Task Manager",
          style: TextStyle(
            fontSize: 25,
            // fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: SingleChildScrollView(
          child: ListBody(
            children: tasks.map((item) {
              return TaskTile(
                title: item['title'],
                id: item['_id'],
                email: widget.email,
              );
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kpurple,
        child: Center(
          child: Icon(
            Icons.add,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewTask(
                // id: widget.id,
                email: widget.email,
              ),
            ),
          );
        },
      ),
    );
  }
}
