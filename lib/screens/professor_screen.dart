// Imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_bound/components/deadline_card.dart';
import 'package:time_bound/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:time_bound/components/header.dart';
import 'package:time_bound/components/button.dart';
import 'package:time_bound/components/display_card.dart';
import 'dart:convert';
import 'package:time_bound/screens/create_course_screen.dart';

class ProfessorScreen extends StatefulWidget {
  static const String id = 'professor_screen_id';

  @override
  State<ProfessorScreen> createState() => _ProfessorScreenState();
}

class _ProfessorScreenState extends State<ProfessorScreen> {
  List<Widget> courses = [Container()];
  late FirebaseFirestore _db;
  late FirebaseAuth _auth;

  @override
  void initState() {
    _db = FirebaseFirestore.instance;
    _auth = FirebaseAuth.instance;
    get_courses();
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
                children: courses
              )
            ),
            Center(
              child: Button(
                content: Text(
                  "Create new course",
                  style: generalHeaderStyle,
                ),
                onPress: () {
                  Navigator.pop(context);
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

  void get_courses_helper(var res) {
    var tmp_courses = List.generate(
      res.docs.length,
      (index) => DisplayCard(
        course_name: res.docs[index].id,
        color: kTangerine,
        deadlines: Container(),
        width: 350,
      )
    );
    setState(() {
      courses = tmp_courses;
    });
  }

  void get_courses() {
    _db.collection('courses').where('professor', isEqualTo: _auth.currentUser?.email).get().then(
      (res) => (
        get_courses_helper(res)
      ),
    );
  }
}
