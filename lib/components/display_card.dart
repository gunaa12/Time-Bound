// Imports
import 'package:flutter/material.dart';
import 'package:time_bound/constants.dart';
import 'package:time_bound/components/button.dart';
import 'package:time_bound/screens/assignment_screen.dart';

class DisplayCard extends StatelessWidget {
  // Attributes
  final String course_name;
  final Color color;
  final Widget deadlines;
  final double width;

  DisplayCard({required this.course_name, required this.color, required this.deadlines, required this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: color,
        child: SizedBox(
          width: width,
          height: 100,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    this.course_name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Button(
                    content: Icon(
                      Icons.edit,
                    ),
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AssignmentScreen(course_name: this.course_name)
                          )
                      );
                    },
                    color: kRed,
                    width: 20,
                  ),
                ],
              ),
              deadlines,
            ]
          ),
        ),
      ),
    );
  }
}
