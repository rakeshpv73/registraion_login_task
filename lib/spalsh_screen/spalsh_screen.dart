import 'dart:async';
import 'package:flutter/material.dart';
import 'package:registraion_login_task/login_page/login_page.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("WELCOME USER")),
    );
  }
}
