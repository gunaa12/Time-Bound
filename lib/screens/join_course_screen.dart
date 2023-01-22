// Imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_bound/constants.dart';
import 'package:time_bound/components/button.dart';
import 'package:time_bound/components/header.dart';

class JoinCourseScreen extends StatefulWidget {
  static const String id = 'join_course_screen_id';

  @override
  State<JoinCourseScreen> createState() => _JoinCourseScreenState();
}

class _JoinCourseScreenState extends State<JoinCourseScreen> {
  late FirebaseAuth _auth;
  late FirebaseFirestore _db;

  bool _course_name_set = false;
  String _course_name = "";

  @override
  void initState() {
    _auth = FirebaseAuth.instance;
    _db = FirebaseFirestore.instance;
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
                child: Container(
                  child: SizedBox(
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
                )
            ),
            Button(
              onPress: () async {
                if (!_course_name_set) {
                  return;
                }

                var doc = await _db.collection('courses').doc(_course_name).get();
                if (!doc.exists) {
                  print("Doc does not exist!");
                  return;
                }

                _db.collection('users').doc(_auth.currentUser?.email).update({
                  'courses': FieldValue.arrayUnion([_course_name]),
                });

                Navigator.pop(context);
              },
              content: Text(
                "Join!",
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