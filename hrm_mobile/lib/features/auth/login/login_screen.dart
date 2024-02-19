import 'dart:convert';
import 'package:hrm_mobile/constants/config.dart';
import 'package:hrm_mobile/features/home/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hrm_mobile/constants/color_schemes.g.dart';
import 'package:hrm_mobile/constants/ui.dart';
import 'package:shared_preferences/shared_preferences.dart'; 

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void login() async {
    if(userNameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var reqBody = {
        "email": userNameController.text,
        "password": passwordController.text
      };
      var response = await http.post(
        Uri.http(baseUrl, loginUrl),
        headers: {"Content-Type":"application/json"},
        body: jsonEncode(reqBody)
      );
      var jsonResponse = jsonDecode(response.body);
      if(response.statusCode == 200) {
        var accessToken = jsonResponse['accessToken'];
        prefs.setString("accessToken", accessToken);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(acccessToken: accessToken)));
      } else {
        const snackBar = SnackBar(
            content: Text('Some thing went wrong'),
            // action: SnackBarAction(
            //   label: 'Undo',
            //   onPressed: () {
            //     // Some code to undo the change.
            //   },
            // ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: UIConstants.SCREEN_PADDING_X),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text( 'Welcome back  ',
                    style: TextStyle(color: Colors.black, fontSize: 35),
                  ),
                  Icon( Icons.waving_hand, color: Color(0xffFEC318), size: 30.0),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text( 'to ',
                    style: TextStyle(color: Colors.black, fontSize: 35),
                  ),
                  Text( 'HRM System',
                    style: TextStyle(color: lightColorScheme.primary, fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text( 'Hello there, log in to continue ',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
              const SizedBox(height: 30),
              TextField(
                      controller: userNameController,
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
              const SizedBox(height: 30),
              TextField(
                      controller: passwordController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.centerRight,
                child: Text( 'Forgot password?',
                        style: TextStyle(color: lightColorScheme.primary, fontSize: 14, fontWeight: FontWeight.bold),
                      ),
              ),
              const SizedBox(height: 30),
              FilledButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                ),
                onPressed: () { login(); },
                child: const Text('Login'),
              ),
            ],
          ))
    );
  }
}
