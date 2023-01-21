// Imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_bound/constants.dart';
import 'package:time_bound/components/button.dart';
import 'package:time_bound/screens/professor_screen.dart';
import 'package:time_bound/screens/student_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = "register_screen_id";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Attributes
  //late FirebaseAuth _auth;
  late String _email;
  late String _password;
  late String _reenter_password;

  bool _selected_student_option = false;
  bool _is_student = true;

  bool _highlight_student = false;
  bool _highlight_professor = false;

  /*
  @override
  void initState() {
    _auth = FirebaseAuth.instance;
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                    tag: 'icon',
                    child: Image.asset(
                      'assets/images/icon.png',
                      height: 300,
                    ),
                ),
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
                      hintStyle: TextStyle(color: Colors.black),
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
                Container(
                  width: 375,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (String text) {
                      _reenter_password = text;
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    obscureText: true,
                    decoration: kInputFieldDecoration.copyWith(
                      hintText: 'Re-Enter password here',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  width: 375,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        content: Text(
                          "Student",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        color: _highlight_student ? kEmerald: Colors.white,
                        width: 150,
                        onPress: () async {
                          _selected_student_option = true;
                          _is_student = true;
                          setState(() {
                            _highlight_student = true;
                            _highlight_professor = false;
                          });
                        }),
                      SizedBox(width: 30,),
                      Button(
                        content: Text(
                          "Professor",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        color: _highlight_professor ? kEmerald: Colors.white,
                        width: 150,
                        onPress: () async {
                          _selected_student_option = true;
                          _is_student = true;
                          setState(() {
                            _highlight_student = false;
                            _highlight_professor = true;
                          });
                        }
                      ),
                    ],
                  ),
                ),
                Hero(
                  tag: 'RegisterButton',
                  child: Button(
                      content: Text(
                          'Register',
                          style: registerStyle,
                      ),
                      color: kOrange,
                      onPress: () async {
                        if (_highlight_student) {
                          Navigator.pushNamed(context, StudentScreen.id);
                        }
                        else if (_highlight_professor) {
                          Navigator.pushNamed(context, ProfessorScreen.id);
                        }
                        // try {
                        //   await _auth.createUserWithEmailAndPassword(
                        //       email: _email, password: _password);
                        //   Navigator.pushNamed(context, LobbyScreen.id);
                        // }
                        // catch (e) {
                        //   print(e);
                        // }
                      }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}