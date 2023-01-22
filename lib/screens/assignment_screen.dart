// Imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_bound/components/header.dart';
import 'package:time_bound/components/button.dart';
import 'package:time_bound/constants.dart';
import 'package:date_field/date_field.dart';

class AssignmentScreen extends StatelessWidget {
  static const String id = 'assignment_screen_id';

  late FirebaseFirestore _db = FirebaseFirestore.instance;
  late FirebaseAuth _auth = FirebaseAuth.instance;
  bool _assignment_name_set = false;
  bool _due_time_set = false;
  late String _assignment_name;
  late DateTime _due_time;
  final String course_name;

  AssignmentScreen({required this.course_name});

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
                          _assignment_name_set = true;
                          _assignment_name = text;
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
                          hintText: 'Assignment name',
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 325,
                      child: DateTimeFormField(
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.0)),
                            borderSide: BorderSide(color: kOrange, width: 2.0),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          errorStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(
                            Icons.event_note,
                            color: Colors.white,
                          ),
                          labelText: "Due date",
                        ),
                        mode: DateTimeFieldPickerMode.dateAndTime,
                        autovalidateMode: AutovalidateMode.always,
                        onDateSelected: (DateTime value) {
                          _due_time_set = true;
                          _due_time = value;
                        },
                      ),
                    ),
                  ],
                )
            ),
            Button(
              onPress: () {
                if (_assignment_name_set && _due_time_set) {
                  _db.collection('courses').doc(course_name).update({
                    'deadlines': FieldValue.arrayUnion([{'assignment_name': this._assignment_name, 'due_time': this._due_time}])
                  });
                }
                Navigator.pop(context);
              },
              content: Text(
                "Create Assignment!",
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