import 'package:flutter/material.dart';
import 'package:registraion_login_task/login_page/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({super.key,});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
  
class _RegisterScreenState extends State<RegisterScreen> {
  final enternameController = TextEditingController();
  final enterpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final RegExp emailRegExp = RegExp( r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$', );
   bool isValidEmail(String email) { return emailRegExp.hasMatch(email); }
   bool isValidPassword(String password) { return password.length >= 8; }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sign up for Free",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (value) {
                       if (value == null || value.isEmpty) { return 'Please enter an email'; 
                       } else if (
                        !isValidEmail(value)) 
                        { return 'Please enter a valid email'; } return null; },
                    controller: enternameController,
                    decoration: InputDecoration(
                    labelText: "Your Email Address",
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )),),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  validator: (value) { 
                    if (value == null || value.isEmpty) { 
                      return 'Please enter a password'; 
                      } else if (!isValidPassword(value)) 
                      { return 'Password must be at least 8 characters long'; }
                       return null;},
                  controller: enterpasswordController,
                  decoration: InputDecoration(
                  labelText: "Your Password",
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )),),
                SizedBox(height: 15,),
                TextField(decoration: InputDecoration(
                  labelText: "Your Confirm Password",
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )),),
                SizedBox(height: 15,),
                
                SizedBox(height: 15,),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) 
                    {final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  if (enternameController.text.isNotEmpty &&
                      enterpasswordController.text.isNotEmpty) {
                    print("hey");

                    await prefs.setString("userName", enternameController.text);
                    await prefs.setString("pass", enterpasswordController.text);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  }}
                       },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:  Colors.blue.shade500
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Center(child: Text("Sing up",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),)),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an Accoungt?",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                  },
                  child: Text("Sing in",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.blue.shade500),))
              ],
            ),
          ],
        ),
      )),
    );
  }
}