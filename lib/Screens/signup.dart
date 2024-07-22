import 'package:firebase_auth/firebase_auth.dart';
import 'package:scopefinalproject/Screens/HomeScreen.dart';
import 'package:scopefinalproject/reuseablewidgets/reusabel-widget.dart';
import 'package:scopefinalproject/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _ageTextController = TextEditingController();
  TextEditingController _dobTextController = TextEditingController();
  TextEditingController _stateTextController = TextEditingController();

  void _saveUserData(String uid) async {
    final url = Uri.https(
        'add own link', 'users/$uid.json');

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'username': _userNameTextController.text,
          'email': _emailTextController.text,
          'age': _ageTextController.text,
          'dob': _dobTextController.text,
          'password': _passwordTextController.text, // Store password (encrypted if possible)
          'state': _stateTextController.text,
        }),
      );

      if (response.statusCode == 200) {
        print("User data sent to database");
      } else {
        print("Failed to send user data to database: ${response.statusCode}");
      }
    } catch (error) {
      print("Error sending user data to database: $error");
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter UserName",
                  Icons.person_outline,
                  false,
                  _userNameTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter Email Id",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter Password",
                  Icons.lock_outlined,
                  true,
                  _passwordTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter Age",
                  Icons.cake,
                  false,
                  _ageTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter Date of Birth",
                  Icons.calendar_today,
                  false,
                  _dobTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter State",
                  Icons.location_on,
                  false,
                  _stateTextController,
                ),
                const SizedBox(height: 20),
                firebaseUIButton(context, "Sign Up", () async {
                  try {
                    // Register user in Firebase Authentication
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text);

                    // Save user data to Realtime Database
                    _saveUserData(userCredential.user!.uid);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Created New Account"),
                        duration: Duration(seconds: 5),
                      ),
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } catch (e) {
                    print("Error ${e.toString()}");
                  }
                }),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
