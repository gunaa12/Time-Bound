import 'package:flutter/material.dart';
import 'package:flutter_timeline/flutter_timeline.dart';
import 'package:flutter_timeline/indicator_position.dart';
import 'package:flutter_timeline/timeline_theme.dart';
import 'package:flutter_timeline/timeline_theme_data.dart';
import 'package:time_bound/constants.dart';
import 'package:time_bound/components/deadline_card.dart';
import 'package:time_bound/components/indicator.dart';

class CustomTimeline extends StatefulWidget {
  const CustomTimeline({super.key});

  @override
  State<StatefulWidget> createState() => _CustomTimeline();
}

class _CustomTimeline extends State<CustomTimeline> {
  late List<TimelineEventDisplay> events;

  @override
  void initState() {
    List<String> dbEntries = ["CS 352", "CS 362", "CS 405", "CS 468"];
    super.initState();
    events = [
      generateEvent("CS 381"),
      generateEvent("CS 354"),
    ];

    for(int i = 0; i <dbEntries.length; i++) {
      events.add(generateEvent(dbEntries.elementAt(i)));
    }


    // int dbSize = 10;
    // String dbEntry = "DATABASE ENTRY";
    // for(int i = 0; i < dbSize; i++) {
    //   events.add(generateEvent(dbEntry));
    // }

  }

  @override
  Widget build(BuildContext context) {
    //retrieve data from database

    return _buildTimeline();

  }

  TimelineEventDisplay generateEvent(String course_name) {
    return TimelineEventDisplay(
      child: DeadlineCard(
        course_name: course_name,
        deadlines: Container(),
        color: kOrange,
        date: "Jan 22",
      ),
      indicatorSize: 56,
      indicator: Indicator(
          display_icon: Icons.access_alarms_rounded,
      ),
    );
  }

  Widget _buildTimeline() {
    return TimelineTheme(
        data: TimelineThemeData(
            lineColor: kPurple, lineGap: 0),
        child: Timeline(
          anchor: IndicatorPosition.center,
          indicatorSize: 56,
          altOffset: Offset(5, 10),
          events: events,
        ),
    );
  }
}