// Imports
import 'package:flutter/material.dart';
import 'package:time_bound/screens/assignment_screen.dart';
import 'package:time_bound/screens/join_course_screen.dart';
import 'package:time_bound/screens/login_screen.dart';
import 'package:time_bound/screens/home.dart';
import 'package:time_bound/screens/register_screen.dart';
import 'package:time_bound/screens/professor_screen.dart';
import 'package:time_bound/screens/student_screen.dart';
import 'package:time_bound/screens/create_course_screen.dart';

void main() => runApp(timeBound());

class timeBound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Bound',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black12,
      ),

      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ProfessorScreen.id: (context) => ProfessorScreen(),
        StudentScreen.id: (context) => StudentScreen(),
        CreateCourseScreen.id: (context) => CreateCourseScreen(),
        JoinCourseScreen.id: (context) => JoinCourseScreen(),
        AssignmentScreen.id: (context) => AssignmentScreen(course_name: "deafult",),
      },
    );
  }
}
