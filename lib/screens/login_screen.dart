// Imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:time_bound/constants.dart';
import 'package:time_bound/components/button.dart';
import 'package:time_bound/screens/professor_screen.dart';
import 'package:time_bound/screens/student_screen.dart';


class LoginScreen extends StatefulWidget {
  static const String id = "login_screen_id";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late FirebaseAuth _auth;
  late String _email;
  late String _password;
  late FirebaseFirestore _db;

  @override
  void initState() {
    _auth = FirebaseAuth.instance;
    _db = FirebaseFirestore.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(tag: 'icon', child: icon),
              SizedBox(height:20),
              Container(
                width: 375,
                padding: EdgeInsets.all(10),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (String text) {
                    _email = text;
                  },
                  decoration: kInputFieldDecoration.copyWith(
                    hintText: 'Enter e-mail here',
                    hintStyle: TextStyle(
                        color: Colors.black
                    ),
                  ),
                ),
              ),
              Container(
                width: 375,
                padding: EdgeInsets.all(10),
                child: TextField(
                  onChanged: (String text) {
                    _password = text;
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  obscureText: true,
                  decoration: kInputFieldDecoration.copyWith(
                    hintText: 'Enter password here',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Hero(
                tag: 'LoginButton',
                child: Button(
                  content: Text(
                    'Login',
                    style: loginStyle,
                  ),
                  color: kTangerine,
                  onPress: () async {
                    final user = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
                    if (user == null) {
                      return;
                    }

                    final reference = await _db.collection('users').doc(_email).get();
                    final is_student = reference.data()!['student'];

                    if (is_student) {
                      Navigator.pushNamed(context, StudentScreen.id);
                    }
                    else {
                      Navigator.pushNamed(context, ProfessorScreen.id);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}