import 'package:flutter/material.dart';
import 'src/login_page/login_screen.dart'; //로그인 페이지 import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Appplication Front-End',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), //앱 시작시 로그인 페이지로 이동
    );
  }
}
