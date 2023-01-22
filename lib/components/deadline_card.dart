// Imports
import 'package:flutter/material.dart';
import 'package:time_bound/constants.dart';

class DeadlineCard extends StatefulWidget {
  // Attributes
  final String course_name;
  final String date;
  final Color color;
  final Widget deadlines;

  DeadlineCard({required this.course_name, required this.date, required this.color, required this.deadlines});

  @override
  State<DeadlineCard> createState() => _DeadlineCardState();
}

class _DeadlineCardState extends State<DeadlineCard> {
  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: widget.color,
        child: SizedBox(
          width: 350,
          height: 100,
          child: Column(
            children: [
              Text(
                this.widget.course_name,
                style: generalHeaderStyle,
              ),
              Text(
                this.widget.date,
                style: generalHeaderStyle,
              ),
              widget.deadlines,
              Slider(
                value: progress,
                max: 100,
                divisions: 10,
                label: progress.toString(),
                onChanged: (double value) {
                  setState(() {
                    progress = value;
                  });
                },
              ),
            ]
          ),
        ),
      ),
    );
  }
}
