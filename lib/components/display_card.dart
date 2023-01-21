// Imports
import 'package:flutter/material.dart';

class DisplayCard extends StatefulWidget {
  const DisplayCard({Key? key}) : super(key: key);

  @override
  State<DisplayCard> createState() => _DisplayCardState();
}

class _DisplayCardState extends State<DisplayCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
        width: 300,
        height: 100,
        child: Center(child: Text('Elevated Card')),
        ),
      ),
    );
  }
}
