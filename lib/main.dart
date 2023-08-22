// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_manage/home_page.dart';
import 'package:task_manage/login_page.dart';
import 'package:task_manage/task_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id:(context) => LoginPage(),
        // HomePage.id:(context) => HomePage(),
        // TaskPage.pageId:(context) => TaskPage(id: id)
      },
    );
  }
}
