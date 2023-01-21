// Imports
import 'package:flutter/material.dart';
import 'package:time_bound/components/header.dart';
import 'package:time_bound/components/button.dart';
import 'package:time_bound/constants.dart';

class CreateCourseScreen extends StatefulWidget {
  static const String id = 'create_course_screen_id';

  @override
  State<CreateCourseScreen> createState() => _CreateCourseScreenState();
}

class _CreateCourseScreenState extends State<CreateCourseScreen> {
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
              child: Container()
            ),
            Button(
              onPress: () {

              },
              content: Text(
                "Create Course!",
                style: generalHeaderStyle,
              ),
              color: kEmerald,
            ),
          ],
        ),
      ),
    );
  }
}
