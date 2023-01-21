// Imports
import 'package:flutter/material.dart';
import 'package:time_bound/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:time_bound/components/header.dart';
import 'package:time_bound/components/button.dart';
import 'package:time_bound/components/display_card.dart';

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
                  Container(
                    child: DisplayCard(),
                  )
                ],
              )
            ),
            Center(
              child: Button(
                content: Text(
                  "Create new course",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPress: () {  },
                color: Colors.white,
              ),
            )
          ],
        )
      ),
    );
  }
}
