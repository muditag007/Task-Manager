// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:task_manage/constants.dart';
import 'package:task_manage/home_page.dart';

class LoginPage extends StatefulWidget {
  static String id = 'loginpage';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Task Manager",
                style: TextStyle(
                  fontSize: 50,
                  // color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            TextField(
              controller: _username,
              decoration: kTextFieldDecoLogin.copyWith(
                hintText: "eg. muditag007",
                labelText: "Enter Username",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _username,
              obscureText: true,
              decoration: kTextFieldDecoLogin.copyWith(
                hintText: "eg. abcd1234",
                labelText: "Enter Password",
              ),
            ),
            SizedBox(
              height: 55,
            ),
            InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              // overlayColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      // id: widget.id,
                      email: _username.text,
                    ),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  color: kpurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              // overlayColor: Colors.transparent,
              onTap: () {},
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  color: kpurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
