// Imports
import 'package:flutter/material.dart';
import 'package:time_bound/screens/login.dart';
import 'package:time_bound/screens/register.dart';


void main() => runApp(timeBound());

class timeBound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Bound',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black12,
      ),

      initialRoute: RegisterScreen.id,
      routes: {
        // HomeScreen.id: (context) => HomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
      },
    );
  }
}
