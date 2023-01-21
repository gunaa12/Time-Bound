// Imports
import 'package:flutter/material.dart';
import 'package:time_bound/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:time_bound/firebase_options.dart';
import 'package:time_bound/button.dart';
import 'package:time_bound/screens/login_screen.dart';
import 'package:time_bound/screens/register_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen_id";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    initializeFirebase();
  }

  void initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(tag: 'icon', child: icon),
              Text(
                'Time Bound',
                style: TextStyle(
                  // fontFamily: 'Audiowide',
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: kEmerald,
                ),
              ),
              Text(
                'Schedule with ease.',
                style: TextStyle(
                  // fontFamily: 'Audiowide',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: kPurple,
                ),
              ),
              SizedBox(height: 60),
              Hero(
                tag: 'LoginButton',
                child: Button(
                    content: Text('Login',
                        style: loginStyle,
                    ),
                    color: kTangerine,
                    onPress: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    }
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
                    onPress: () {
                      Navigator.pushNamed(context, RegisterScreen.id);
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}