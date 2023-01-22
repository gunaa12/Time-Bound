// Imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline/event_item.dart';
import 'package:intl/intl.dart';
import 'package:time_bound/components/header.dart';
import 'package:time_bound/components/button.dart';
import 'package:time_bound/components/timeline.dart';
import 'package:time_bound/constants.dart';
import 'package:time_bound/screens/join_course_screen.dart';
import '../components/deadline_card.dart';
import '../components/indicator.dart';

class StudentScreen extends StatefulWidget {
  static const String id = 'student_screen_id';

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  late FirebaseFirestore _db;
  late FirebaseAuth _auth;
  late var timeline = CustomTimeline(events: [TimelineEventDisplay(child: Container())]);

  @override
  void initState() {
    _db = FirebaseFirestore.instance;
    _auth = FirebaseAuth.instance;
    generateTimeline();
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
                child: timeline
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

  void generateTimeline() {
    _db.collection('users').doc(_auth.currentUser?.email).get().then(
       (res) => generateTimelineHelper(res)
    );
  }

  Future<void> generateTimelineHelper(var res) async {
    var enrolled_courses = res.data()['courses'];
    var all_courses_deadlines = [];
    for (String course in enrolled_courses) {
      var course_doc = await _db.collection('courses').doc(course).get();
      var deadlines = course_doc.data()!['deadlines'];
      for (var deadline in deadlines) {
        deadline['course_name'] = course;
        all_courses_deadlines.add(deadline);
      }
    }

    all_courses_deadlines.sort((a, b) => a['due_time'].compareTo(b['due_time']));

    List<TimelineEventDisplay> deadline_events = [];
    for (var deadline in all_courses_deadlines) {
      deadline_events.add(generateEvent(deadline));
    }

    print(deadline_events);

    timeline = CustomTimeline(events: deadline_events);

    setState(() {});
  }

  TimelineEventDisplay generateEvent(var deadline) {
    var millis = 978296400000;
    var dt = DateTime.fromMillisecondsSinceEpoch(millis);
    var format = DateFormat('mm/dd, HH:mm').format(dt);
    return TimelineEventDisplay(
      child: DeadlineCard(
        course_name: deadline['course_name'],
        deadlines: Container(),
        color: kOrange,
        date: DateFormat('MM/dd, HH:mm').format(deadline['due_time'].toDate()),
        assignment_name: deadline['assignment_name'],
      ),
      indicatorSize: 56,
      indicator: Indicator(
          display_icon: Icons.access_alarms_rounded,
      ),
    );
  }
}