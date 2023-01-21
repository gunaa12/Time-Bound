// Imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_bound/constants.dart';


class LoginScreen extends StatefulWidget {
  static const String id = "login_screen_id";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // late FirebaseAuth _auth;
  late String _email;
  late String _password;

  @override
  void initState() {
    // _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hero(tag: 'logo', child: logo),
                SizedBox(height:20),
                Container(
                  width: 375,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    onChanged: (String text) {
                      _email = text;
                    },
                    // decoration: kInputFieldDecoration.copyWith(
                    //   hintText: 'Enter e-mail here',
                    //   hintStyle: TextStyle(color: Colors.white),
                    // ),
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
                      color: Colors.white,
                    ),
                    obscureText: true,
                    // decoration: kInputFieldDecoration.copyWith(
                    //   hintText: 'Enter password here',
                    //   hintStyle: TextStyle(color: Colors.white),
                    // ),
                  ),
                ),
                // Hero(
                //   tag: 'LoginButton',
                //   child: Button(
                //     content: Text('Login'),
                //     color: kLightOrange,
                //     onPress: () async {
                //       final user = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
                //       if (user != null) {
                //         Navigator.pushNamed(context, LobbyScreen.id);
                //       }
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}