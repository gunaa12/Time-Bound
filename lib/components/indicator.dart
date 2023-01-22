// Imports
import 'package:flutter/material.dart';
import 'package:time_bound/constants.dart';

class Indicator extends StatelessWidget {
  IconData display_icon;

  Indicator({required this.display_icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      child: Icon(
        display_icon,
        color: Colors.white,
        size: 36,
      ),
      decoration: BoxDecoration(
          color: kRed,
          borderRadius: BorderRadius.all(
            Radius.circular(64),
          ),
          boxShadow: [
            BoxShadow(
              color: kEmerald,
              blurRadius: 32,
              offset: Offset(0, 4),
            )
          ]
      ),
    );
  }
}