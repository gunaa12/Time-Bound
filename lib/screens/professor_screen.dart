// Imports
import 'package:flutter/material.dart';
import 'package:time_bound/components/deadline_card.dart';
import 'package:time_bound/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:time_bound/components/header.dart';
import 'package:time_bound/components/button.dart';
import 'package:time_bound/components/display_card.dart';
import 'package:time_bound/screens/create_course_screen.dart';

class ProfessorScreen extends StatefulWidget {
  static const String id = 'professor_screen_id';

  @override
  State<ProfessorScreen> createState() => _ProfessorScreenState();
}

class _ProfessorScreenState extends State<ProfessorScreen> {
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
                  DisplayCard(
                    color: kTangerine,
                    course_name: "CS 381",
                    deadlines: Container(),
                    width: 350,
                  ),
                  // DeadlineCard(
                  //     date: "Jan 22",
                  //     color: kRed,
                  //     deadlines: Container())
                ],
              )
            ),
            Center(
              child: Button(
                content: Text(
                  "Create new course",
                  style: generalHeaderStyle,
                ),
                onPress: () {
                  Navigator.pushNamed(context, CreateCourseScreen.id);
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
