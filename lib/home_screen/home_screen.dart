import 'package:flutter/material.dart';
import 'package:registraion_login_task/login_page/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome User"),
          IconButton(onPressed: ()  async {
             final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
// navigate to home page if already logged

                prefs.setBool("Is Loging", false);  
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }, icon: Icon(Icons.logout_outlined))
        ],
      )),
    );
  }
}