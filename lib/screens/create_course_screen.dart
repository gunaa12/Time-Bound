// Imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_bound/components/header.dart';
import 'package:time_bound/components/button.dart';
import 'package:time_bound/constants.dart';
import 'package:date_field/date_field.dart';
import 'package:time_bound/screens/professor_screen.dart';

class CreateCourseScreen extends StatefulWidget {
  static const String id = 'create_course_screen_id';

  @override
  State<CreateCourseScreen> createState() => _CreateCourseScreenState();
}

class _CreateCourseScreenState extends State<CreateCourseScreen> {
  late FirebaseFirestore _db;
  late FirebaseAuth _auth;
  late String _course_name;
  bool _course_name_set = false;

  @override
  void initState() {
    _db = FirebaseFirestore.instance;
    _auth = FirebaseAuth.instance;
  }

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
                  SizedBox(
                    width: 325,
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (String text) {
                        _course_name_set = true;
                        _course_name = text;
                      },
                      decoration: kInputFieldDecoration.copyWith(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kOrange, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kOrange, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        hintText: 'Course name',
                        hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ),
            Button(
              onPress: () {
                if (_course_name_set) {
                  _db.collection('courses').doc(_course_name).set({
                    'professor': _auth.currentUser?.email
                  });
                  Navigator.pop(context);
                  Navigator.pushNamed(context, ProfessorScreen.id);
                }
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
