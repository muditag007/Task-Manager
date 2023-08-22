// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:task_manage/all_api.dart';
import 'package:task_manage/constants.dart';
import 'package:task_manage/home_page.dart';

class NewTask extends StatefulWidget {
  // static String pageId = 'taskpage';
  // final String id;
  final String email;
  const NewTask({super.key, required this.email});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  TextEditingController _title = TextEditingController();
  TextEditingController _desc = TextEditingController();

  late Map data;

  confirm() async {
    Map info = {
      "email": widget.email,
      "tasks": {
        "title": _title.text,
        "description": _desc.text,
        "status": "incomplete",
      }
      // "id": widget.id,
    };
    data = await AllApi().getData(info, "/add");
    // print(data);
    // _title.text = data['task']['title'];
    // _desc.text = data['task']['description'];
    // setState(() {});
  }

  // @override
  // void initState() {
  //   fetch();
  //   super.initState();
  // }

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
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "  Title",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _title,
              decoration: kTextFieldDecoLogin,
              maxLines: 2,
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "  Description",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _desc,
              maxLines: 10,
              decoration: kTextFieldDecoLogin,
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "  Status",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Spacer(),
            InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              // overlayColor: Colors.transparent,
              onTap: () async {
                await confirm();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      // id: widget.id,
                      email: widget.email,
                    ),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  color: kpurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
