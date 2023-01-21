// Imports
import 'package:flutter/material.dart';
import 'package:time_bound/components/header.dart';
import 'package:time_bound/components/button.dart';
import 'package:time_bound/components/display_card.dart';
import 'package:time_bound/constants.dart';
import 'package:time_bound/screens/join_course_screen.dart';

class StudentScreen extends StatefulWidget {
  static const String id = 'student_screen_id';

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Header(),
                Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: DisplayCard(
                            color: kTangerine,
                            course_name: 'CS 381',
                            deadlines: Container(),
                          ),
                        )
                      ],
                    )
                ),
                Center(
                  child: Button(
                    content: Text(
                      "Join Course",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPress: () {
                      Navigator.pushNamed(context, JoinCourseScreen.id);
                    },
                    color: kEmerald,
                  ),
                )
              ],
            )
        ),
      );
  }
}