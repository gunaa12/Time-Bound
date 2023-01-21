// Imports
import 'package:flutter/material.dart';
import 'package:time_bound/constants.dart';

class DisplayCard extends StatelessWidget {
  // Attributes
  final String course_name;
  final Color color;
  final Widget deadlines;

  DisplayCard({required this.course_name, required this.color, required this.deadlines});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: color,
        child: SizedBox(
          width: 350,
          height: 100,
          child: Column(
            children: [
              Text(
                this.course_name,
                style: generalHeaderStyle,
              ),
              deadlines,
            ]
          ),
        ),
      ),
    );
  }
}
