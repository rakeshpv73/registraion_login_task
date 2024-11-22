import 'package:flutter/material.dart';
import 'package:registraion_login_task/spalsh_screen/spalsh_screen.dart';


void main(List<String> args) {
runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:SpalshScreen(),
    );
  }
}