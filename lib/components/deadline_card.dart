// Imports
import 'package:flutter/material.dart';
import 'package:time_bound/constants.dart';

class DeadlineCard extends StatefulWidget {
  // Attributes
  final String course_name;
  final String date;
  final Color color;
  final Widget deadlines;
  final String assignment_name;

  DeadlineCard({required this.assignment_name, required this.course_name, required this.date, required this.color, required this.deadlines});

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
          child: Column(
            children: [
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    this.widget.course_name,
                    style: generalHeaderStyle2,
                  ),
                  Text(
                    this.widget.assignment_name,
                    style: generalHeaderStyle2,
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Text(
                this.widget.date,
                style: generalHeaderStyle2,
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
